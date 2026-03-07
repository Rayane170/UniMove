import 'package:flutter/material.dart';

class LangueOption extends StatelessWidget {
  const LangueOption({super.key});

  @override
  Widget build(BuildContext context) {
    String langue = "Français";
    return Scaffold(
      appBar: AppBar(title: const Text("Langue")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Sélectionnez votre langue"),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: langue,
              items: const [
                DropdownMenuItem(value: "Français", child: Text("Français")),
                DropdownMenuItem(value: "Anglais", child: Text("Anglais")),
                DropdownMenuItem(value: "Arabe", child: Text("Arabe")),
              ],
              onChanged: (val) {},
            ),
          ],
        ),
      ),
    );
  }
}