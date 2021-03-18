import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:oriental_management/screens/dashboard.dart';
import 'package:oriental_management/screens/gallery_screen.dart';
import 'package:oriental_management/screens/happenings_screen.dart';

import 'package:oriental_management/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home-screen';

  final String? uid;

  HomeScreen({Key? key, this.uid}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final tabs = [
    DashBoard(),
    HappeningScreen(),
    GalleryScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        iconSize: 20,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.calendarAlt),
            label: 'Happenings',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.images),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
