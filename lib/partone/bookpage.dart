import 'package:book_base/bookcontainer/book_container.dart';
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
    String? storedSem = prefs.getString('sem')!;
    setState(() {
      sem = storedSem;
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
      backgroundColor: AppColors.primary,

      appBar: AppBar(
        backgroundColor: const Color(0xffE7EEF0),
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
      body: Column(
        children: [
          topcontaine(),
          firstSelected
              ? Expanded(
                  child: Column(
                    children: [
                      BookContainer(
                        imagePath: 'assets/booksimages/sem1-maths.png',
                        title: 'Mathematics - 1',
                        description:
                            'This book covers differential calculus and algebra for Semester 1 students.',
                      ),
                      BookContainer(
                        imagePath: 'assets/booksimages/sem1-maths.png',
                        title: 'Mathematics - 1',
                        description:
                            'This book covers differential calculus and algebra for Semester 1 students.',
                      ),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  Container topcontaine() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.secondary, width: 2),
        ),
        color: const Color(0xffE7EEF0),
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        firstSelected = true;
                      });
                    },

                    child: Column(
                      children: [
                        Text(
                          'Books',
                          style: firstSelected
                              ? GoogleFonts.plusJakartaSans(
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )
                              : GoogleFonts.plusJakartaSans(
                                  color: AppColors.secondary.withValues(
                                    alpha: 0.6,
                                  ),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                ),
                        ),
                        if (firstSelected)
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            width: 50,
                            height: 3,
                            color: AppColors.secondary,
                          ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        firstSelected = false;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          'Question Papers',
                          style: firstSelected
                              ? GoogleFonts.plusJakartaSans(
                                  color: AppColors.secondary.withValues(
                                    alpha: 0.6,
                                  ),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 20,
                                )
                              : GoogleFonts.plusJakartaSans(
                                  color: AppColors.secondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                        ),
                        if (!firstSelected)
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            width: 120,
                            height: 3,
                            color: AppColors.secondary,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
