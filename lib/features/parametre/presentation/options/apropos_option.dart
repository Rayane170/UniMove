import 'package:flutter/material.dart';

class AproposOption extends StatelessWidget {
  const AproposOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("À propos de l'application")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Unimove v0.1\nApplication de réservation de vélos et trottinettes.\n"
          "Version basique pour test.",
        ),
      ),
    );
  }
}