import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1115),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1115),
        elevation: 0,
        title: const Text("Profil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// CARTE PROFIL
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1B1E24),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: const [

                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Rayane Taleb",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    "Matricule : UO20250123",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// STATISTIQUES
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                _statCard("Trajets", "34", Icons.route),

                _statCard("CO2", "8.3 kg", Icons.eco),

              ],
            ),

            const SizedBox(height: 30),

            /// BOUTONS
            _actionButton(Icons.edit, "Modifier profil"),

            const SizedBox(height: 10),

            _actionButton(Icons.credit_card, "Ajouter carte"),

            const SizedBox(height: 10),

            _actionButton(Icons.history, "Voir historique"),

            const SizedBox(height: 10),

            _actionButton(Icons.logout, "Se déconnecter"),
          ],
        ),
      ),
    );
  }

  /// WIDGET STATISTIQUE
  static Widget _statCard(String titre, String valeur, IconData icon) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1B1E24),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.green, size: 28),
            const SizedBox(height: 10),
            Text(
              valeur,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              titre,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  /// BOUTON ACTION
  static Widget _actionButton(IconData icon, String text) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFF1B1E24),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          Icon(icon, color: Colors.green),
          const SizedBox(width: 15),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}