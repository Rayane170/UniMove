import 'package:flutter/material.dart';

class ReservasionPage extends StatefulWidget {
  const ReservasionPage({super.key});

  @override
  State<ReservasionPage> createState() => _ReservasionPageState();
}

class _ReservasionPageState extends State<ReservasionPage> {
  String typeVehicule = "Vélo";
  int duree = 30;

  @override
  Widget build(BuildContext context) {
    double prix = duree * 0.1;

    return Scaffold(
      backgroundColor: const Color(0xFF0F1115),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1115),
        elevation: 0,
        title: const Text("Réserver un vélo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// CARD VEHICULE
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1B1E24),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/velo.png",
                    height: 120,
                  ),
                  const SizedBox(height: 10),

                  Text(
                    "Vélo #12",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Rue de l'Université",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 20),

                  /// TYPE VEHICULE
                  DropdownButton<String>(
                    value: typeVehicule,
                    dropdownColor: Colors.grey.shade900,
                    style: const TextStyle(color: Colors.white),
                    items: const [
                      DropdownMenuItem(
                        value: "Vélo",
                        child: Text("Vélo"),
                      ),
                      DropdownMenuItem(
                        value: "Trottinette",
                        child: Text("Trottinette"),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        typeVehicule = value!;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// DUREE
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Durée",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            Slider(
              value: duree.toDouble(),
              min: 10,
              max: 120,
              divisions: 11,
              label: duree.toString(),
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  duree = value.toInt();
                });
              },
            ),

            const SizedBox(height: 20),

            /// PRIX
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1B1E24),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    "Prix",
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${prix.toStringAsFixed(2)} €",
                    style: const TextStyle(
                      fontSize: 30,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// BOUTON CONFIRMER
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Confirmer",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}