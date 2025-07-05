import 'package:book_base/partone/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    anonKey: 'https://pntknnmosjctqykrjylm.supabase.co',
    url:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBudGtubm1vc2pjdHF5a3JqeWxtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE3MDc5ODYsImV4cCI6MjA2NzI4Mzk4Nn0.B0d-vJSUPQIeKL2SoVs6V5WIx6xCcEKRhPLLh1wMB-w',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: const SplashScreen()),
    );
  }
}
