import 'package:flutter/material.dart';


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
