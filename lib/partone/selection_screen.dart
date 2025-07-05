import 'package:book_base/partone/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  Future<void> signOut(BuildContext context) async {
    try {
      // Sign out from Firebase
      await FirebaseAuth.instance.signOut();

      // Also sign out from Google (optional but recommended)
      await GoogleSignIn().signOut();

      // Optional: Navigate back to login screen or show a message
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Signed out successfully')));
    } catch (e) {
      print("Sign-out error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Sign-out failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            signOut(context);
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ));
          },
          child: const Text('Go to Home'),
        ),
      ),
    );
  }
}
