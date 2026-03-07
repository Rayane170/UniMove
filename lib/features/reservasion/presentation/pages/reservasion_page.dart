import 'package:flutter/material.dart';

class ReservasionPage extends StatefulWidget {
  const ReservasionPage({super.key});

  @override
  State<ReservasionPage> createState() => _ReservasionPageState();
}

class _ReservasionPageState extends State<ReservasionPage> {
  String typeVehicule = "VÃ©lo";
  int duree = 30;

  @override
  Widget build(BuildContext context) {
    double prix = duree * 0.1;

    return Scaffold(
      appBar: AppBar(
        title: const Text("RÃ©servation"),
        backgroundColor: const Color(0xFF3D3C3B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Type de vÃ©hicule",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            DropdownButton<String>(
              value: typeVehicule,
              dropdownColor: Colors.grey.shade800,
              items: const [
                DropdownMenuItem(value: "VÃ©lo", child: Text("VÃ©lo")),
                DropdownMenuItem(value: "Trottinette", child: Text("Trottinette")),
              ],
              onChanged: (value) {
                setState(() {
                  typeVehicule = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              "DurÃ©e (minutes)",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Slider(
              value: duree.toDouble(),
              min: 10,
              max: 120,
              divisions: 11,
              label: duree.toString(),
              onChanged: (value) {
                setState(() {
                  duree = value.toInt();
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              "Prix estimÃ© : ${prix.toStringAsFixed(2)} â‚¬",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Confirmer rÃ©servation"),
              ),
            )
          ],


          
        ),
      ),
    );
  }
}