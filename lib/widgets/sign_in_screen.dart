import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'reset_password_screen.dart';

String? savedName;
String? savedLogin;
String? savedPassword;

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _checkLogin() {
    String login = loginController.text.trim();
    String password = passwordController.text.trim();

    if (login == savedLogin && password == savedPassword) {
      showDialog(
        context: context,
        builder: (ctx) => const AlertDialog(
          title: Text("Успішний вхід ✅"),
          content: Text("Ви увійшли в систему"),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => const AlertDialog(
          title: Text("Помилка ❌"),
          content: Text("Неправильний логін або пароль"),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Вхід")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Авторизація",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: loginController,
                  decoration: const InputDecoration(labelText: "Логін"),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Пароль"),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _checkLogin,
                  child: const Text("Увійти"),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupScreen()),
                    );
                  },
                  child: const Text("Зареєструватися"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
                    );
                  },
                  child: const Text("Забули пароль?"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
