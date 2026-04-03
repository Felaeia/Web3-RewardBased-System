import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web3 Reward Based System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFDDE8F9),
          primary: Colors.blueAccent,
        ),
        scaffoldBackgroundColor: const Color(0xFFDDE8F9),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
