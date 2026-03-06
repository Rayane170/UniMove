import 'package:flutter/material.dart';

class MotDePasseOptionPage extends StatefulWidget {
  const MotDePasseOptionPage({super.key});

  @override
  State<MotDePasseOptionPage> createState() => _MotDePasseOptionPageState();
}

class _MotDePasseOptionPageState extends State<MotDePasseOptionPage> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();

  void _changerMotDePasse() {
    String ancien = oldPasswordController.text;
    String nouveau = newPasswordController.text;

    // Fake logique : ancien mot de passe = 1234
    if (ancien == "1234" && nouveau.length >= 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mot de passe changé avec succès !')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Erreur : ancien mot de passe incorrect ou nouveau trop court')),
      );
    }

    oldPasswordController.clear();
    newPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modifier le mot de passe')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: oldPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Ancien mot de passe'),
            ),
            TextField(
              controller: newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Nouveau mot de passe'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changerMotDePasse,
              child: const Text('Modifier'),
            ),
          ],
        ),
      ),
    );
  }
}