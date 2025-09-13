import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final String role =
        ModalRoute.of(context)?.settings.arguments as String? ?? "mahasiswa";

    return Scaffold(
      appBar: AppBar(title: Text("Dashboard $role")),
      body: Center(
        child: Text(
          "Selamat datang, $role!",
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
