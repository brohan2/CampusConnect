import 'package:campusconnect/utilities/nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:campusconnect/utilities/search_bar.dart';
import 'package:campusconnect/utilities/sidebar_drawer.dart';
import 'package:campusconnect/utilities/feild_selection.dart';
import 'package:campusconnect/utilities/project_listing.dart';
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
        drawer: sidebar_drawer(drawerHeaderHeight: drawerHeaderHeight),
        
      body: Column(
        children: [
          SizedBox(height: 20,),
          LandingPage(),
          LandingPage(),
        ],
      ),
    );
  }
}
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Handle container 1 click
                print('Container 1 clicked!');
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
                    'Container 1',
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