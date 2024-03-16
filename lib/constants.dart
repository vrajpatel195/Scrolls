import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scrolls/view/screens/add_video.dart';
import 'package:scrolls/view/screens/display_screen.dart';

// getRandomColor() => Colors.primaries[Random().nextInt(Colors.primaries.length)];

getRandomColor() => [
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
][Random().nextInt(3)];

const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;
const primaryColor = Color(0xff151414);
const darkBackgroundColor = Color(0xff0C090A);

var pageindex = [
  DisplayVideo_Screen(),
  Text('Search'),
  AddVideoScreen(),
  Text('Message'),
  Text('Profile')
];
