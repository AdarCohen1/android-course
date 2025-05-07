import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/otp_verification_screen.dart';
import 'screens/phone_input_screen.dart';
import 'screens/download_screen.dart'; // ✅ import your download screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginScreen(title: 'Login App'),
      routes: {
        '/otp': (context) => const OtpVerificationScreen(),
        '/phone': (context) => const PhoneInputScreen(),
        '/download': (context) => const DownloadScreen(), // ✅ add download screen route
      },
    );
  }
}
