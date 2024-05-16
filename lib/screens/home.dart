import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:campusconnect/utilities/search_bar.dart';
import 'package:campusconnect/utilities/sidebar_drawer.dart';
import 'package:campusconnect/utilities/feild_selection.dart';
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
      appBar: AppBar( 
        title: Text("Campus Connect"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(200)
          )
        ),
        
        leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Open the drawer on button press
                },
              );
            },
        ),
      ),
        drawer: sidebar_drawer(drawerHeaderHeight: drawerHeaderHeight),
        
      body: Container(
        child: Column(
          children: [
          
            
          SizedBox(height: 10,),
          SearchBar1(),
          FilterButtonList(),
          Expanded(
            child: SingleChildScrollView(
                  child: Column(children: [
                     ProjectListing(
                        image: AssetImage('images/agriapp.jpeg'),
                        title: 'Agriculture App',
                        description: 'This internship provides hands-on experience in software development.',
                        skillsRequired: ['Flutter', 'Dart', 'Firebase'],
          
                        onPressedExplore: () {
            // Add your explore button action here
                            print('Explore button pressed');
                        },
                    ),
                     ProjectListing(
                        image: AssetImage('images/agriapp.jpeg'),
                        title: 'Agriculture App',
                        description: 'This internship provides hands-on experience in software development.',
                        skillsRequired: ['Flutter', 'Dart', 'Firebase'],
          
                        onPressedExplore: () {
            // Add your explore button action here
                            print('Explore button pressed');
                        },
                    ),
                     ProjectListing(
                        image: AssetImage('images/agriapp.jpeg'),
                        title: 'Agriculture App',
                        description: 'This internship provides hands-on experience in software development.',
                        skillsRequired: ['Flutter', 'Dart', 'Firebase'],
          
                        onPressedExplore: () {
            // Add your explore button action here
                            print('Explore button pressed');
                        },
                    ),
                     ProjectListing(
                        image: AssetImage('images/agriapp.jpeg'),
                        title: 'Agriculture App',
                        description: 'This internship provides hands-on experience in software development.',
                        skillsRequired: ['Flutter', 'Dart', 'Firebase'],
          
                        onPressedExplore: () {
            // Add your explore button action here
                            print('Explore button pressed');
                        },
                    ),
              
            
                      
                ],
              ),
                  ),
          ),
          ],

        
        ),
      ),
    );
  }
}









class ProjectListing extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String description;
  final List<String> skillsRequired;
  final VoidCallback onPressedExplore;

  const ProjectListing({
    required this.image,
    required this.title,
    required this.description,
    required this.skillsRequired,
    required this.onPressedExplore,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(image: image, height: 150, width: double.infinity, fit: BoxFit.cover),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Skills Required:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Wrap(
            spacing: 5,
            children: skillsRequired.map((skill) => Chip(label: Text(skill))).toList(),
          ),
          SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: onPressedExplore,
              child: Text('Explore'),
            ),
          ),
        ],
      ),
    );
  }
}