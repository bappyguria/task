import 'package:flutter/material.dart';
import 'package:task/ui/screens/auth/login/login_screen.dart';
import 'package:task/ui/screens/auth/signup/signup_screen.dart';

void main() {
  runApp(const AppDashbordApp());
}

class AppDashbordApp extends StatelessWidget {
  const AppDashbordApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CP Contact Farming',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF3F4F6),
        fontFamily: 'Roboto',
      ),
      home: const LoginScreen(),
    );
  }
}

