import 'package:campusconnect/utilities/project_listing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:campusconnect/utilities/search_bar.dart';
import 'package:campusconnect/utilities/sidebar_drawer.dart';
import 'package:campusconnect/utilities/feild_selection.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:campusconnect/utilities/add_project.dart';

class Teamup extends StatelessWidget {
  const Teamup({
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
