import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String role = "mahasiswa"; // default role

  void _login() {
    String id = idController.text.trim();
    String password = passwordController.text.trim();

    if (id.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Mohon isi semua field")));
      return;
    }

    // Dummy login
    Navigator.pushReplacementNamed(context, '/home', arguments: role);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login PJBLMS")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: role,
              onChanged: (value) {
                setState(() {
                  role = value!;
                });
              },
              items: const [
                DropdownMenuItem(value: "admin", child: Text("Admin")),
                DropdownMenuItem(value: "dosen", child: Text("Dosen")),
                DropdownMenuItem(value: "mahasiswa", child: Text("Mahasiswa")),
              ],
            ),
            TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: role == "mahasiswa"
                    ? "NIM"
                    : role == "dosen"
                    ? "NIDN"
                    : "Username Admin",
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _login, child: const Text("Login")),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              child: const Text("Belum punya akun? Register"),
            ),
          ],
        ),
      ),
    );
  }
}
