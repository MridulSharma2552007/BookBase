// ignore_for_file: camel_case_types

import 'package:book_base/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Select Semester',
          style: GoogleFonts.plusJakartaSans(
            color: AppColors.secondary,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              semContainer(
                semName: 'Semester 1',
                semImage: 'assets/semImages/sem_one.png',
                onPressed: () {},
              ),
              semContainer(
                semName: 'Semester 2',
                semImage: 'assets/semImages/sem_two.png',
                onPressed: () {},
              ),
              semContainer(
                semName: 'Semester 3',
                semImage: 'assets/semImages/sem_three.png',
                onPressed: () {},
              ),
              semContainer(
                semName: 'Semester 4',
                semImage: 'assets/semImages/sem_four.png',
                onPressed: () {},
              ),
              semContainer(
                semName: 'Semester 5',
                semImage: 'assets/semImages/sem_five.png',
                onPressed: () {},
              ),
              semContainer(
                semName: 'Semester 6',
                semImage: 'assets/semImages/sem_six.png',
                onPressed: () {},
              ),
              semContainer(
                semName: 'Semester 7',
                semImage: 'assets/semImages/sem_seven.png',
                onPressed: () {},
              ),
              semContainer(
                semName: 'Semester 8',
                semImage: 'assets/semImages/sem_eight.png',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class semContainer extends StatelessWidget {
  final String semName;
  final String semImage;
  final VoidCallback onPressed;
  const semContainer({
    super.key,
    required this.semName,
    required this.semImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(semImage),

        Padding(
          padding: const EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                semName,
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  onPressed;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Select',
                  style: GoogleFonts.plusJakartaSans(color: AppColors.primary),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
