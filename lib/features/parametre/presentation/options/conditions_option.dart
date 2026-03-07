import 'package:flutter/material.dart';

class ConditionsOption extends StatelessWidget {
  const ConditionsOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Conditions d'utilisation")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Voici les conditions d'utilisation de l'application. "
          "Elles sont basiques pour le moment.",
        ),
      ),
    );
  }
}