import 'package:book_base/partone/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    anonKey: 'https://lauiqjjvmlmheafjhzpq.supabase.co',
    url:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxhdWlxamp2bWxtaGVhZmpoenBxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTE2MzU1ODAsImV4cCI6MjA2NzIxMTU4MH0.5NOmv3zxqaF54uJYIri2LvCYYyHffRLEwGozvfoF1OU',
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
