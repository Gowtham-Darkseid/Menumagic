import 'package:flutter/material.dart';
import 'dart:async';
import 'screens/start.dart'; // Import your start screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AR Menu App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: SplashScreen(), // Set SplashScreen as home
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to StartScreen after 2 seconds
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => StartScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set splash screen background color
      body: Center(
        child: Image.asset(
          'assets/img/logo.png', // Add the logo in your assets folder
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
