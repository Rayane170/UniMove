import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mode sombre / clair"),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text("Mode clair"),
          ),
          ListTile(
            title: Text("Mode sombre"),
          ),
        ],
      ),
    );
  }
}