import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scrolls/model/video.dart';
import 'package:scrolls/view/screens/home_screen.dart';
import 'package:video_compress/video_compress.dart';

class UploadController extends GetxController{
  compressVideoFile(String videoFilePath)async {
      final compressedVideoFile = await VideoCompress.compressVideo(videoFilePath,quality: VideoQuality.DefaultQuality);
      return compressedVideoFile!.file;
  }
uploadCompressedVideoFileToFirebaseStorage(String videoID, String videoFilePath)async{
  UploadTask videoUploadTask = FirebaseStorage.instance.ref().child("videos").child(videoID).putFile(await compressVideoFile(videoFilePath));

  TaskSnapshot snapshot = await videoUploadTask;
  String downloadUrlOfUploadedVideo = await snapshot.ref.getDownloadURL();
  return downloadUrlOfUploadedVideo;
}

  getThumbnailImage(String videoFilePath)async{
final thumbnailImage = await VideoCompress.getFileThumbnail(videoFilePath);
return thumbnailImage;
  }
  uploadThumbnailImageToFirebaseStorage(String videoID, String videoFilePath)async{
  UploadTask thumbnailUploadTask = FirebaseStorage.instance.ref().child("thumbnails").child(videoID).putFile(await getThumbnailImage(videoFilePath));

  TaskSnapshot snapshot = await thumbnailUploadTask;
  String downloadUrlOfUploadedThumbnail = await snapshot.ref.getDownloadURL();
  return downloadUrlOfUploadedThumbnail;
}

saveVideoInformationToFirestoreDatabase(String artistSongname,String description,String videoFilePath,BuildContext context)async{
  try{
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
    String id = DateTime.now().millisecondsSinceEpoch.toString();

    String videoDownloadUrl = await uploadCompressedVideoFileToFirebaseStorage(id, videoFilePath);
        String thumbnailDownloadUrl = await uploadThumbnailImageToFirebaseStorage(id, videoFilePath);

        Video videoObject = Video(  uid: FirebaseAuth.instance.currentUser!.uid,
      username: (userDoc.data()! as Map<String , dynamic>)['name'],
      videoUrl: videoDownloadUrl,
      thumbnail: thumbnailDownloadUrl,
      songName: artistSongname,
      shareCount: 0,
      commentsCount: 0,
      likes: [],
      profilePic: (userDoc.data()! as Map<String , dynamic>)['profilePic'],
      caption: description,
      id: id);

      await FirebaseFirestore.instance.collection("videos").doc(id).set(videoObject.toJson());
      Get.to(HomeScreen());
          Get.snackbar("Video Uploaded Successfully", "Thank You Sharing Your Content");


  }catch(e){
    Get.snackbar("Upload Unsuccessfull", e.toString());
  }
}
}