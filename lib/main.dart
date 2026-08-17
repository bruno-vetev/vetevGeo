import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const RotaTesteApp());
}

class RotaTesteApp extends StatelessWidget {
  const RotaTesteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vetev Geo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashScreen(),
    );
  }
}