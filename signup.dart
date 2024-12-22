import 'package:armenu/screens/login.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(  // Add scrolling for smaller screens
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset('assets/img/logo.png', height: 100),
              const SizedBox(height: 20),

              // Full Name TextField
              TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
              const SizedBox(height: 16),

              // Email TextField
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
              const SizedBox(height: 16),

              // Password TextField
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                ),
              ),
              const SizedBox(height: 40),

              // Sign Up Button with increased size and padding
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Increased padding
                  textStyle: TextStyle(fontSize: 20), // Larger font size
                  backgroundColor: Colors.blue, // Button background color
                  foregroundColor: Colors.white, // Text color
                ),
                child: const Text('Sign Up'),
              ),
              const SizedBox(height: 20),

              // Continue with
              const Text('or sign up with'),
              const SizedBox(height: 20),

              // Facebook Sign Up Button with border and custom background color
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.facebook, size: 28), // Larger icon size
                label: const Text('Sign Up with Facebook', style: TextStyle(fontSize: 18)), // Larger text size
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40), // Button padding
                  backgroundColor: Colors.white, // Facebook blue background
                  foregroundColor: Colors.black, // Text and icon color
                  side: BorderSide(color: Colors.blue[400]!, width: 2), // Border color (dark blue)
                ),
              ),
              const SizedBox(height: 20),

              // Log In link
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()), // Navigate to LoginScreen
                ),
                child: const Text('Already have an account? Log In', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
