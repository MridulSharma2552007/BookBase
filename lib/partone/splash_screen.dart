import 'package:book_base/partone/bypass.dart';
import 'package:book_base/partone/login_screen.dart';
import 'package:book_base/partone/selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:book_base/colors/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 0.0;
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        opacity = 1.0;
        checkLoginStatus();
      });
    });
    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => isLoggedIn ? SelectionScreen() : LoginScreen(),
        ),
      );
    });
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    setState(() {
      isLoggedIn = isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: AnimatedOpacity(
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          opacity: opacity,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
