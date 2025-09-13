import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const PJBLMSApp());
}

class PJBLMSApp extends StatelessWidget {
  const PJBLMSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PJBLMS',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
