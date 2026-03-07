import 'package:flutter/material.dart';

class MotDePasseOption extends StatelessWidget {
  const MotDePasseOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Changer mot de passe")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Mot de passe actuel"),
              obscureText: true,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Nouveau mot de passe"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text("Valider")),
          ],
        ),
      ),
    );
  }
}