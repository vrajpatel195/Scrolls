

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class ScrollsVideoPlayer extends StatefulWidget {
  Uri videoUrl;
   ScrollsVideoPlayer({super.key,required this.videoUrl});

  @override
  State<ScrollsVideoPlayer> createState() => _ScrollsVideoPlayerState();
}

class _ScrollsVideoPlayerState extends State<ScrollsVideoPlayer> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController  = VideoPlayerController.networkUrl(widget.videoUrl)..initialize().then((value) {videoPlayerController.play();
    videoPlayerController.setLooping(true);});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.black, 

      ),
      child: VideoPlayer(videoPlayerController),
    );
  }
}
