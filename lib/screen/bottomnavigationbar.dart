import 'package:flutter/material.dart';
import 'package:instagram/screen/add%20postpage.dart';
import 'package:instagram/screen/reelspage.dart';
import 'package:instagram/screen/home%20screen.dart';

import 'package:instagram/screen/profile.dart';
import 'package:instagram/screen/search%20screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  final List<Widget> otherPages = [
    HomePage(),
    SearchPage(),
    AddPostPage(),
    ReelsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        iconSize: 24, // Adjust this value as needed
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem( icon: Icon(Icons.add_circle_outline), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.slow_motion_video), label: ""),
         
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
      body: otherPages[currentIndex],
    );
  }
}
