import 'package:book_base/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bookpage extends StatefulWidget {
  const Bookpage({super.key});

  @override
  State<Bookpage> createState() => _BookpageState();
}

class _BookpageState extends State<Bookpage> {
  String sem = '';

  void semname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sem = prefs.getString('sem')!;
    setState(() {
      sem = sem;
    });
  }

  @override
  void initState() {
    super.initState();
    semname();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          sem,
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
