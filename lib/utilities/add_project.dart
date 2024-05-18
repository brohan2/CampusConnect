import 'package:flutter/material.dart';

class AddProjectPage extends StatefulWidget {
  @override
  _AddProjectPageState createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Project"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(200))),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the add project screen
            // You can use Navigator.push() to navigate to the add project screen
            // Example:
            // Navigator.push(context, MaterialPageRoute(builder: (context) => AddProjectScreen()));
            print("Navigate to add project screen");
          },
          child: Text("Add Project"),
        ),
      ),
    );
  }
}
