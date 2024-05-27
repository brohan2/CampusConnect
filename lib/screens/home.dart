import 'package:campusconnect/screens/connect.dart';
import 'package:campusconnect/screens/teamup.dart';
import 'package:campusconnect/screens/threads.dart';
import 'package:campusconnect/utilities/topnavbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
// import 'package:campusconnect/utilities/search_bar.dart';
import 'package:campusconnect/utilities/sidebar_drawer.dart';
// import 'package:campusconnect/utilities/feild_selection.dart';
// import 'package:campusconnect/utilities/project_listing.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      double drawerHeaderHeight = Platform.isAndroid ? 100.0 : 150.0; // Different height for Android

    return Scaffold(
      appBar: AppBarDefault(),
        drawer: SidebarDrawer(drawerHeaderHeight: drawerHeaderHeight),
        
      body: Column(
        children: [
          SizedBox(height: 20,),
          LandingPage(title: "Teamup",color:"blue"),
          LandingPage(title : "Connections",color:"red"),
          LandingPage(title : "Thread",color:"red"),

        ],
      ),
    );
  }
}
class LandingPage extends StatelessWidget {
  final String title;
  final String color;
  LandingPage({required this.title , required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              // Handle container click
              print('$title clicked!');
              switch(title){
                case "Teamup":
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Teamup()),
                );   
                case "Connections":
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Connect()),
                );   
                case "Thread":
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThreadsPage()),
                );
               
              }
                   },
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(

                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
