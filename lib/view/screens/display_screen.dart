import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:scrolls/controller/video_controller.dart';
import 'package:scrolls/view/screens/comment_screen.dart';
import 'package:scrolls/view/widgets/AlbumRotator.dart';

import '../widgets/ProfileButton.dart';
import '../widgets/ScrollsVideoPlayer.dart';

class DisplayVideo_Screen extends StatelessWidget {
  DisplayVideo_Screen({super.key});
  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
            scrollDirection: Axis.vertical,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            itemCount: videoController.videoList.length,
            itemBuilder: (context, index) {
              final data = videoController.videoList[index];
              return Stack(
                children: [
                  ScrollsVideoPlayer(
                    videoUrl: Uri.parse(data.videoUrl),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.username,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text(data.caption,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        Text(data.songName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height - 450,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 2.5,
                          right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ProfileButton(
                            profilePhotoUrl: data.profilePic,
                          ),
                          InkWell(
                            onTap: () {
                              videoController.likedVideo(data.id);
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  size: 35,
                                  color: Colors.pinkAccent,
                                ),
                                Text(
                                  data.likes.length.toString(),
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.reply,
                                size: 35,
                                color: Colors.white,
                              ),
                              Text(
                                data.shareCount.toString(),
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) => CommentScreen(id: data.id,))));
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.comment,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                Text(
                                  data.commentsCount.toString(),
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              AlbumRotator(profilePicUrl: data.profilePic)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            });
      }),
    );
  }
}
