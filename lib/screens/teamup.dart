import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:campusconnect/utilities/search_bar.dart';
import 'package:campusconnect/utilities/sidebar_drawer.dart';
import 'package:campusconnect/utilities/feild_selection.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:campusconnect/utilities/add_project.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double drawerHeaderHeight =
        Platform.isAndroid ? 100.0 : 150.0; // Different height for Android

    return Scaffold(
      appBar: AppBar(
        title: Text("Campus Connect"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200))),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context)
                    .openDrawer(); // Open the drawer on button press
              },
            );
          },
        ),
      ),
      drawer: SidebarDrawer(drawerHeaderHeight: drawerHeaderHeight),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Welcome to Campus Connect',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Connect with projects and internships that match your skills and interests.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            SearchBar1(),
            FilterButtonList(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Featured Projects',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ProjectListing(
                  image: AssetImage('images/agriapp.jpeg'),
                  title: 'Agriculture App',
                  description:
                      'This internship provides hands-on experience in software development.',
                  skillsRequired: ['Flutter', 'Dart', 'Firebase'],
                  onPressedExplore: () {
                    // Add your explore button action here
                    print('Explore button pressed');
                  },
                ),
                ProjectListing(
                  image: AssetImage('images/agriapp.jpeg'),
                  title: 'Agriculture App',
                  description:
                      'This internship provides hands-on experience in software development.',
                  skillsRequired: ['Flutter', 'Dart', 'Firebase'],
                  onPressedExplore: () {
                    // Add your explore button action here
                    print('Explore button pressed');
                  },
                ),
                ProjectListing(
                  image: AssetImage('images/agriapp.jpeg'),
                  title: 'Agriculture App',
                  description:
                      'This internship provides hands-on experience in software development.',
                  skillsRequired: ['Flutter', 'Dart', 'Firebase'],
                  onPressedExplore: () {
                    // Add your explore button action here
                    print('Explore button pressed');
                  },
                ),
                ProjectListing(
                  image: AssetImage('images/agriapp.jpeg'),
                  title: 'Agriculture App',
                  description:
                      'This internship provides hands-on experience in software development.',
                  skillsRequired: ['Flutter', 'Dart', 'Firebase'],
                  onPressedExplore: () {
                    // Add your explore button action here
                    print('Explore button pressed');
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                // Navigate to AddProjectPage when FAB is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProjectPage()),
                );
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.orange,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'What our users say',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '"Campus Connect has been a game-changer for my career!" - Student A',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Text(
                '"I found the perfect internship through Campus Connect." - Student B',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
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
            child: Image(
                image: image,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover),
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
            children: skillsRequired
                .map((skill) => Chip(label: Text(skill)))
                .toList(),
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
