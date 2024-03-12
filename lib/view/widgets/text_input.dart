import 'package:flutter/material.dart';
import 'package:scrolls/constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final IconData myIcon;
  final String myLabelText;
  final bool tohide;
  const TextInputField(
      {super.key,
      required this.controller,
      required this.myIcon,
      required this.myLabelText,
      this.tohide = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: tohide,
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(myIcon),
        
        labelText: myLabelText,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: borderColor,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.blue,

          ),
          
        ),
       
      ),
    );
  }
}
