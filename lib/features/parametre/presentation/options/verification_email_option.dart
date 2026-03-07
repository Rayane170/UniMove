import 'package:flutter/material.dart';

class VerificationEmailOption extends StatelessWidget {
  const VerificationEmailOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Vérification email")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Envoyer email de vérification"),
        ),
      ),
    );
  }
}