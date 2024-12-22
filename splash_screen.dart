import 'package:flutter/material.dart';
import 'main.dart'; // Replace with your actual home page.

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the home page after 2 seconds.
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => start()), // Replace with your main page.
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color.
      body: Center(
        child: Image.asset(
          'assets/img/logo.png', // Replace with the path to your logo.
          width: 150, // Adjust size as needed.
          height: 150,
        ),
      ),
    );
  }
}
