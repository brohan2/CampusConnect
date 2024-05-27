import 'package:campusconnect/screens/home.dart';
import 'package:campusconnect/screens/login.dart';
import 'package:campusconnect/screens/settings.dart';
import 'package:campusconnect/screens/teamup.dart';
import 'package:flutter/material.dart';
import 'package:campusconnect/screens/connect.dart';
import 'package:campusconnect/screens/profile.dart';
import 'package:campusconnect/screens/threads.dart';

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
        '/threadsPage': (context) => ThreadsPage(),
        '/profile': (context) => Profile(),
        '/settings': (context) => settingsPage(),
        '/teamup': (context)=> Teamup(),
        
      },
      debugShowCheckedModeBanner: false,
    );
  }
}