import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
   ProfileButton({super.key, required this.profilePhotoUrl});
String profilePhotoUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(
        children: [
          Positioned(
            left: 5,
              child: Container(
            width: 60,
            height: 60,
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(borderRadius: BorderRadius.circular(30),
            // child: Image(image: NetworkImage(profilePhotoUrl),
            child: Image(image: NetworkImage("https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),

            fit: BoxFit.cover,),),
          ))
        ],
      ),
    );
  }
}
