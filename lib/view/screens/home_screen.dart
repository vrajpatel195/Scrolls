import 'package:flutter/material.dart';
import 'package:scrolls/constants.dart';

import '../widgets/customIcon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        onTap: (index){
          setState(() {
            pageIdx = index;
          });
        },
        currentIndex: pageIdx,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,size: 25,),
          label: "Home"),
           BottomNavigationBarItem(icon: Icon(Icons.search,size: 25,),
          label: "Search"),
           BottomNavigationBarItem(icon: customAddIcon(),
          label: ""),
           BottomNavigationBarItem(icon: Icon(Icons.message,size: 25,),
          label: "Message"),
           BottomNavigationBarItem(icon: Icon(Icons.person,size: 25,),
          label: "Profile")
        ],
      ),
      body: Center(child: pageindex[pageIdx]),
    );
  }
}