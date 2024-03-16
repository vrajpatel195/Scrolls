import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scrolls/constants.dart';
import 'package:scrolls/controller/upload_controller.dart';
import 'package:scrolls/controller/upload_video_controller.dart';
import 'package:scrolls/view/widgets/text_input.dart';
import 'package:video_player/video_player.dart';

class AddCaptionScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  AddCaptionScreen(
      {super.key, required this.videoFile, required this.videoPath});

  @override
  State<AddCaptionScreen> createState() => _AddCaptionScreenState();
}

class _AddCaptionScreenState extends State<AddCaptionScreen> {
  UploadController uploadVideoConntroller = Get.put(UploadController());
  late VideoPlayerController videoPlayerController;
   VideoUploadController videoUploadController = Get.put(VideoUploadController());
  TextEditingController songNameController = new TextEditingController();
  TextEditingController captionController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videoFile);
    });
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(0.7);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.8,
              child: VideoPlayer(videoPlayerController),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/4,
        
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextInputField(
                      controller: songNameController,
                      myIcon: Icons.music_note,
                      myLabelText: "Song name"),
                      SizedBox(height: 12,),
                       TextInputField(
                      controller: captionController,
                      myIcon: Icons.closed_caption,
                      myLabelText: "Caption"),
                      SizedBox(height: 8,),
                      ElevatedButton(onPressed: (){
                        uploadVideoConntroller.saveVideoInformationToFirestoreDatabase(songNameController.text, captionController.text, widget.videoPath,context);
                      }, child: Text("Upload",style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(backgroundColor: buttonColor),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
