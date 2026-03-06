import 'package:flutter/material.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Langue"),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text("Français"),
          ),
          ListTile(
            title: Text("English"),
          ),
          ListTile(
            title: Text("العربية"),
          ),
        ],
      ),
    );
  }
}