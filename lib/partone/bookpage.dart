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
  bool firstSelected = true;

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
        backgroundColor: AppColors.primary,
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
      body: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.secondary, width: 2),
          ),
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 20,
              left: 20,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        firstSelected = true;
                      });
                    },

                    child: Text(
                      'Books',
                      style: firstSelected
                          ? GoogleFonts.plusJakartaSans(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )
                          : GoogleFonts.plusJakartaSans(
                              color: AppColors.secondary.withOpacity(0.6),
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        firstSelected = false;
                      });
                    },
                    child: Text(
                      'Question Papers',
                      style: firstSelected
                          ? GoogleFonts.plusJakartaSans(
                              color: AppColors.secondary.withOpacity(0.6),
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            )
                          : GoogleFonts.plusJakartaSans(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
