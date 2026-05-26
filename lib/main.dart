import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

void main() {
  runApp(const ScienceStudioApp());
}

class ScienceStudioApp extends StatelessWidget {
  const ScienceStudioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Science Studio',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
        primaryColor: Colors.deepPurple,
      ),
      home: const DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

