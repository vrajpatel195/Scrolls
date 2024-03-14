import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress/video_compress.dart';

class VideoUploadController extends GetxController {
  var uuid = Uuid();
  Future<File> _getThumb(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<String> uploadVideoThumbToStorage(String ID, String videoPath) async {
    Reference reference =
        FirebaseStorage.instance.ref().child("thumbnail").child(ID);
    UploadTask uploadTask = reference.putFile(await _getThumb(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

//Main Video Upload
  uploadVideo(String songName, String caption, String videoPath) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();
    String id = uuid.v1();
    _uploadVideoToStorage(id, videoPath);

    String thumbnail = await uploadVideoThumbToStorage(id, videoPath);
  }

  Future<String> _uploadVideoToStorage(String videoID, String videoPath) async {
    Reference reference =
        FirebaseStorage.instance.ref().child("videos").child(videoID);
    UploadTask uploadTask =
        reference.putFile(_compressVideo(videoPath) as File);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<File?> _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.MediumQuality);
    return compressedVideo!.file;
  }
}
