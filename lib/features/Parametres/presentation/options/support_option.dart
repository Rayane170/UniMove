import 'package:flutter/material.dart';

class SupportOptionPage extends StatelessWidget {
  const SupportOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Support')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Pour toute assistance, contactez-nous à support@exemple.com',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
               
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ouverture du support...')),
                );
              },
              child: const Text('Contacter Support'),
            ),
          ],
        ),
      ),
    );
  }
}