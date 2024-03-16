import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/ProfileButton.dart';
import '../widgets/ScrollsVideoPlayer.dart';

class DisplayVideo_Screen extends StatelessWidget {
  const DisplayVideo_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                ScrollsVideoPlayer(
                  videoUrl: Uri.base,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10, left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("@Username",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Text("My Caption Here",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Text("Song Name3",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height-450,
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/2.5,right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileButton(
                          profilePhotoUrl: "ADD",
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.favorite,
                              size: 35,
                              color: Colors.white,
                            ),
                            Text(
                              "Like",
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ],
                        ),
                         Column(
                          children: [
                            Icon(
                              Icons.reply,
                              size: 35,
                              color: Colors.white,
                            ),
                            Text(
                              "Share",
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ],
                        ),
                         Column(
                          children: [
                            Icon(
                              Icons.comment,
                              size: 35,
                              color: Colors.white,
                            ),
                            Text(
                              "Comments",
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
