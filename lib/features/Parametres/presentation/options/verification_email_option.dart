import 'package:flutter/material.dart';

class VerificationEmailOptionPage extends StatelessWidget {
  const VerificationEmailOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vérification Email')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.email, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Veuillez vérifier votre email pour continuer.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Email vérifié (fake) !')),
                );
              },
              child: const Text('Vérifier maintenant'),
            ),
          ],
        ),
      ),
    );
  }
}