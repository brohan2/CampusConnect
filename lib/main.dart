import 'package:campusconnect/screens/home.dart';
import 'package:campusconnect/utilities/login.dart';
import 'package:campusconnect/utilities/settings.dart';
import 'package:flutter/material.dart';
import 'package:campusconnect/utilities/connect.dart';
import 'package:campusconnect/utilities/profile.dart';
import 'package:campusconnect/utilities/threads.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // Set initial route
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => Home(),
        '/connect': (context) => Connect(),
        '/threads': (context) => Threads(),
        '/profile': (context) => Profile(),
        '/settings': (context) => settingsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
