import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrolls/controller/auth_controller.dart';
import 'package:scrolls/controller/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  String uid;
  ProfileScreen({super.key, required this.uid});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
final ProfileController profileController = Get.put(ProfileController());
final AuthController authController = Get.put(AuthController());

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    profileController.updateUseId(widget.uid);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Username"),
        centerTitle: true,
        actions: [Icon(Icons.info_outline)],
      ),
      body: GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: controller.user['profilePic'],
                          fit: BoxFit.cover,
                          height: 100,
                          width: 100,
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.user['followers'],
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Followers",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.user['following'],
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Following",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.user['likes'],
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Likes",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black12)),
                    child: Center(child: InkWell(
                      onTap: (){
                        if(widget.uid == FirebaseAuth.instance.currentUser!.uid){
                          authController.signOut();
                        }else{
                          controller.followUser();
                        }
                      },
                      child: Text(widget.uid == FirebaseAuth.instance.currentUser!.uid ?  "Sign Out" :
                      controller.user['isFollowing'] ? "Following":
                       "Follow"))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(indent: 30,endIndent: 30,),
                  SizedBox(
                    height: 50,
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1, crossAxisSpacing: 5),
                          itemCount: controller.user['thumbnails'].length,
                      itemBuilder: (context, index) {
                        String thumbnail= controller.user['thumbnails'][index];
                        return
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: thumbnail,
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        );
                      })
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
