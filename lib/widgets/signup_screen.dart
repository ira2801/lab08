import 'package:flutter/material.dart';
String? savedName;
String? savedLogin;
String? savedPassword;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _registerUser() {
    String name = nameController.text.trim();
    String login = loginController.text.trim();
    String password = passwordController.text.trim();

    if (login.isEmpty || password.isEmpty|| name.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => const AlertDialog(
          title: Text("Помилка"),
          content: Text("Будь ласка, введіть логін і пароль"),
        ),
      );
      return;
    }
    savedName = name;
    savedLogin = login;
    savedPassword = password;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Реєстрація успішна"),
        content: Text("Імʼя: $name\nЛогін: $login\nПароль: $password"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Реєстрація")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Створіть акаунт", style: TextStyle(fontSize: 22)),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Імʼя",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: loginController,
              decoration: const InputDecoration(
                labelText: "Логін",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Пароль",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registerUser,
              child: const Text("Зареєструватися"),
            ),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Назад"),
            ),
          ],
        ),
      ),
    );
  }
}