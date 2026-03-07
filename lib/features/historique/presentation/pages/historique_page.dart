import 'package:flutter/material.dart';

class HistoriquePage extends StatelessWidget {
  const HistoriquePage({super.key});

  final List<Map<String, dynamic>> reservations = const [
    {
      'type': 'Vélo #12',
      'stationStart': 'Station Centre Ville',
      'stationEnd': 'Université Oran 1',
      'duration': '35 min',
      'price': 2.50,
      'date': '05 Mars 2026',
    },
    {
      'type': 'Vélo #07',
      'stationStart': 'Station Gambetta',
      'stationEnd': 'Université Oran 1',
      'duration': '50 min',
      'price': 3.50,
      'date': '05 Mars 2026',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historique"),
        backgroundColor: const Color(0xFF3D3C3B),
      ),
      body: ListView.builder(
        itemCount: reservations.length,
        itemBuilder: (context, index) {
          final res = reservations[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(res['type']),
              subtitle: Text(
                  '${res['stationStart']} → ${res['stationEnd']}\nDurée: ${res['duration']}\nPrix: ${res['price']}€'),
              trailing: Text(res['date']),
            ),
          );
        },
      ),
    );
  }
}