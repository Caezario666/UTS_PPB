// lib/splash_screen.dart
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 3)); // Menunggu 3 detik
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/ambu.jpg', height: 100), // Ganti dengan logo Anda
            SizedBox(height: 20),
            Text(
              'Selamat Datang di Warung Ajib',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
