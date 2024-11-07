// lib/main.dart
import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warung Ajib',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: Colors.black,
          secondary: Colors.blue[400]!,  // Warna aksen biru
        ),
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontSize: 20),  // Gantikan headline6 dengan titleLarge
          bodyLarge: TextStyle(color: Colors.white),  // Gantikan bodyText1 dengan bodyLarge
          bodyMedium: TextStyle(color: Colors.white),  // Gantikan bodyText2 dengan bodyMedium
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[400],  // Tombol biru
            foregroundColor: Colors.white,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue[400],
          foregroundColor: Colors.white, // Warna putih untuk ikon FAB
        ),
      ),
      home: SplashScreen(),
    );
  }
}
