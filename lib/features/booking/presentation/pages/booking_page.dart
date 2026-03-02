import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  final String stationName;

  const BookingPage({super.key, required this.stationName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Réservation - $stationName"),
      ),
      body: Center(
        child: Text("Vous réservez à $stationName"),
      ),
    );
  }
}
