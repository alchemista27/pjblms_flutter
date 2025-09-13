import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String role = "mahasiswa";

  void _register() {
    String id = idController.text.trim();
    String name = nameController.text.trim();
    String password = passwordController.text.trim();

    if (id.isEmpty || name.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Mohon isi semua field")));
      return;
    }

    // Dummy register success
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Register berhasil sebagai $role")));

    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register PJBLMS")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            DropdownButton<String>(
              value: role,
              onChanged: (value) {
                setState(() {
                  role = value!;
                });
              },
              items: const [
                DropdownMenuItem(value: "dosen", child: Text("Dosen")),
                DropdownMenuItem(value: "mahasiswa", child: Text("Mahasiswa")),
              ],
            ),
            TextField(
              controller: idController,
              decoration: InputDecoration(
                labelText: role == "mahasiswa" ? "NIM" : "NIDN",
              ),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nama Lengkap"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: _register, child: const Text("Register")),
          ],
        ),
      ),
    );
  }
}
