import 'package:flutter/material.dart';

class ReservasionPage extends StatefulWidget {

  final String? vehicleType;
  final String? stationName;

  const ReservasionPage({
    super.key,
    this.vehicleType,
    this.stationName,
  });

  @override
  State<ReservasionPage> createState() => _ReservasionPageState();
}

class _ReservasionPageState extends State<ReservasionPage> {

  int duration = 30;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    /// aucune machine
    if (widget.vehicleType == null) {
      return Scaffold(

        backgroundColor: theme.scaffoldBackgroundColor,

        appBar: AppBar(
          title: const Text("Réservation"),
        ),

        body: Center(
          child: Text(
            "Veuillez sélectionner une machine depuis la carte",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.bodyMedium!.color,
            ),
          ),
        ),
      );
    }

    String image =
        widget.vehicleType == "velo"
            ? "assets/icons/velo2.png"
            : "assets/icons/trot.png";

    return Scaffold(

      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: AppBar(
        title: const Text("Réservation"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            Image.asset(
              image,
              height: 150,
            ),

            const SizedBox(height: 20),

            Text(
              widget.stationName ?? "Station inconnue",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.bodyMedium!.color,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Matricule : UNI-V12",
              style: TextStyle(
                color: theme.textTheme.bodyMedium!.color,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Batterie : 85%",
              style: TextStyle(
                color: theme.textTheme.bodyMedium!.color,
              ),
            ),

            const SizedBox(height: 30),

            Text(
              "Durée de réservation",
              style: TextStyle(
                fontSize: 18,
                color: theme.textTheme.bodyMedium!.color,
              ),
            ),

            Slider(
              value: duration.toDouble(),
              min: 10,
              max: 120,
              divisions: 11,
              label: "$duration min",

              activeColor: theme.colorScheme.primary,

              onChanged: (value) {
                setState(() {
                  duration = value.toInt();
                });
              },
            ),

            Text(
              "$duration min",
              style: TextStyle(
                fontSize: 20,
                color: theme.colorScheme.primary,
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(

                onPressed: () {

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Réservation confirmée"),
                    ),
                  );
                },

                child: const Text(
                  "Confirmer",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}