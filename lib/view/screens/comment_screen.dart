import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrolls/controller/comment_controller.dart';
import 'package:scrolls/model/comment.dart';
import 'package:scrolls/view/widgets/text_input.dart';
import 'package:timeago/timeago.dart' as tago;

class CommentScreen extends StatelessWidget {
  final String id;
   CommentScreen(
    {required this.id}
   );

   final TextEditingController _commentController = TextEditingController();
   CommentController commentController = Get.put(CommentController());


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostID(id);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                    return ListView.builder(shrinkWrap: true,  itemCount: commentController.comments.length, itemBuilder: (context,index){
                      final comment = commentController.comments[index];
                                           

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white, 
                                                       backgroundImage: NetworkImage(comment.profilePic),
                        ),
                        title: Row(children: [
                          Text(comment.username,style: TextStyle(fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.redAccent),),
                          SizedBox(
                            width: 10,
                          ),
                          Text(comment.comment,style: TextStyle(fontSize: 13,
                        ),)
                        ],),
                        subtitle: Row(
                          children: [
              
                            Text(tago.format(comment.datePub.toDate()),style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold
                            ),),
                            SizedBox(width: 5,),
                            Text("${comment.likes.length - 1} Likes",style: TextStyle(fontSize: 10),)
                          ],
                        ),
                        trailing: InkWell(
                          onTap: (){
                            commentController.likeComment(comment.id);
                          },
                          child: Icon(Icons.favorite,color: comment.likes.contains(FirebaseAuth.instance.currentUser!.uid)?Colors.red:Colors.white,)),
                      );
                    });
                  }
                ),
              ),
           
              ListTile(
                title: TextInputField(controller: _commentController, myIcon: Icons.comment, myLabelText: "Comment"),
                trailing: TextButton(onPressed: (){
                  commentController.postComment(_commentController.text);
                },
                child: Text("Send"),),
              )
            ],
          ),
        ),
      ),
    );
  }
}