import 'package:campusconnect/screens/home.dart';
import 'package:campusconnect/screens/connect.dart';
import 'package:campusconnect/screens/profile.dart';
import 'package:campusconnect/screens/threads.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int tabIndex = 0;

  late List<Widget> pages;
  late Home homePage;
  late Profile profile;
  late Threads thread;
  late Connect connect;

  @override
  void initState() {
    homePage = Home();
    profile = Profile();
    thread = Threads();
    connect = Connect();
    pages = [homePage, thread, connect, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        onTabChange: (int index) {
          setState(() {
            tabIndex = index;
          });
        },
        rippleColor: Colors.transparent,
        hoverColor: Colors.transparent,
        haptic: true,
        tabBorderRadius: 15,
        tabActiveBorder: Border.all(color: Colors.orange, width: 1),
        tabBorder: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
        tabShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
        ],
        curve: Curves.easeOutExpo,
        duration: Duration(milliseconds: 900),
        gap: 8,
        color: Colors.grey[800],
        activeColor: Colors.orange,
        iconSize: 40,
        tabBackgroundColor: const Color.fromARGB(255, 66, 66, 66),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.animation_sharp,
            text: 'Threads',
          ),
          GButton(
            icon: Icons.connect_without_contact,
            text: 'Connect',
          ),
          GButton(
            icon: Icons.person_3_outlined,
            text: 'Profile',
          )
        ],
      ),
      body: pages[tabIndex],
    );
  }
}
