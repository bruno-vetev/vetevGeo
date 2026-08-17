import 'package:flutter/material.dart';
import 'route_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const RouteScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: const Center(
        child: Text(
          'Vetev',
          style: TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}