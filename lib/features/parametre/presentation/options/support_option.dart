import 'package:flutter/material.dart';

class SupportOption extends StatelessWidget {
  const SupportOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Support")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            Text("Pour toute aide, contactez: rb40info@gmail.com "),
            SizedBox(height: 10),
            Text("Ou appelez: +213 123 456 789"),
          ],
        ),
      ),
    );
  }
}