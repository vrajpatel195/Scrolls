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
             child: Image(image: NetworkImage(profilePhotoUrl),

            fit: BoxFit.cover,),),
          ))
        ],
      ),
    );
  }
}
