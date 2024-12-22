import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  // Variables to track hover state for buttons
  bool _isLoginHovered = false;
  bool _isSignUpHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo with increased size
            Image.asset(
              'assets/img/logo.png',
              height: 200, // Increased size for logo
            ),
            const SizedBox(height: 30),

            // App Name with increased font size
            const Text(
              'MENUMAGIC',
              style: TextStyle(
                fontSize: 36, // Increased font size
                fontWeight: FontWeight.bold,
                color: Colors.green, // Optional: to match theme color
              ),
            ),
            const SizedBox(height: 50),

            // Login button with hover effect
            MouseRegion(
              onEnter: (_) {
                setState(() {
                  _isLoginHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _isLoginHovered = false;
                });
              },
              child: ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen())),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 70), // Increased padding
                  textStyle: TextStyle(fontSize: 20), // Increased text size
                  backgroundColor: _isLoginHovered ? Colors.green.shade800 : Colors.green, // Hover effect for background color
                  elevation: _isLoginHovered ? 10 : 5, // Hover effect for elevation (shadow)
                ),
                child: const Text('Log In'),
              ),
            ),
            const SizedBox(height: 25), // Space between buttons

            // Sign Up button with hover effect
            MouseRegion(
              onEnter: (_) {
                setState(() {
                  _isSignUpHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _isSignUpHovered = false;
                });
              },
              child: OutlinedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SignUpScreen())),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60), // Increased padding
                  side: BorderSide(width: 2, color: Colors.green), // Optional: green border
                  textStyle: TextStyle(fontSize: 20), // Increased text size
                  foregroundColor: _isSignUpHovered ? Colors.green.shade800 : Colors.green, // Hover effect for text color
                ),
                child: const Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
