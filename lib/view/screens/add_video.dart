import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scrolls/constants.dart';
import 'package:scrolls/view/screens/addcaption_screen.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});
  


  videoPick(ImageSource src,BuildContext context)async {
    final video = await ImagePicker().pickVideo(source: src);
    if(video !=null){
      Get.snackbar("Video Selected", video.path);
      Navigator.push(context,MaterialPageRoute(builder: (context)=>AddCaptionScreen(videoFile: File(video.path), videoPath: video.path)));
    }else{
      Get.snackbar("Error in Selecting Video", "Please Choose diffrent video type");
    }
  }

  showDialogOpt(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () =>videoPick(ImageSource.gallery,context),
                  child: Row(children: [Icon(Icons.photo), SizedBox(width: 7,),Text("Gallery")],)
                ),
                 SimpleDialogOption(
                  onPressed: () =>videoPick(ImageSource.camera,context),
                  child: Row(children: [Icon(Icons.camera_alt), SizedBox(width: 7,),Text("Camera")],)
                ),
                 SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(children: [Icon(Icons.close), SizedBox(width: 7,),Text("Close")],)
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showDialogOpt(context),
          child: Container(
            width: 190,
            height: 40,
            decoration: BoxDecoration(color: buttonColor),
            child: Center(
              child: Text(
                "Add Video",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
