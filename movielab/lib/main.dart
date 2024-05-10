// lib/main.dart
import 'package:flutter/material.dart';
import 'views/begin_screen.dart'; // Correct path to the main_screen.dart file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BeginScreen(),
    );
  }
  /*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Casa de Papel App',
      theme: ThemeData(
        primarySwatch: Colors.red, // Theme color to match the show's theme
      ),
      home: const MainScreen(), // MainScreen is now correctly referenced
    );
  }
  */
}
