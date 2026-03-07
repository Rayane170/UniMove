import 'package:flutter/material.dart';
import '../../../home/presentation/pages/main_home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigue vers la page principale et remplace le login
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const MainHomePage()),
            );
          },
          child: const Text("Connecter"),
        ),
      ),
    );
  }
}