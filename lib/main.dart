import 'package:flutter/material.dart';
import 'ui/views/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Coffee Shop App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
