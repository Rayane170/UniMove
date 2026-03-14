import 'package:flutter/material.dart';

class LangueOption extends StatefulWidget {
  const LangueOption({super.key});

  @override
  State<LangueOption> createState() => _LangueOptionState();
}

class _LangueOptionState extends State<LangueOption> {

  String langue = "Français";

  final List<Map<String, String>> langues = [
    {"nom": "Français", "flag": "🇫🇷"},
    {"nom": "Anglais", "flag": "🇬🇧"},
    {"nom": "Arabe", "flag": "🇩🇿"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1115),

      appBar: AppBar(
        title: const Text("Langue"),
        backgroundColor: const Color(0xFF0F1115),
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Choisissez votre langue",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 20),

            ...langues.map((l) {

              bool selected = langue == l["nom"];

              return GestureDetector(
                onTap: () {
                  setState(() {
                    langue = l["nom"]!;
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Langue changée : ${l["nom"]}"),
                    ),
                  );
                },

                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),

                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    color: selected
                        ? Colors.green.withOpacity(0.15)
                        : const Color(0xFF1B1E24),

                    borderRadius: BorderRadius.circular(14),

                    border: Border.all(
                      color: selected ? Colors.green : Colors.transparent,
                      width: 2,
                    ),
                  ),

                  child: Row(
                    children: [

                      Text(
                        l["flag"]!,
                        style: const TextStyle(fontSize: 26),
                      ),

                      const SizedBox(width: 14),

                      Expanded(
                        child: Text(
                          l["nom"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      if (selected)
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}