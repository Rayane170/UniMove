import 'package:flutter/material.dart';

class HistoriquePage extends StatelessWidget {
  const HistoriquePage({super.key});

  final List<Reservation> reservations = const [
    Reservation(
      type: 'Vélo #12',
      stationStart: 'Station Centre Ville',
      stationEnd: 'Université Oran 1',
      duration: '35 min',
      price: 2.50,
      date: '05 Mars 2026',
    ),
    Reservation(
      type: 'Vélo #07',
      stationStart: 'Station Gambetta',
      stationEnd: 'Université Oran 1',
      duration: '50 min',
      price: 3.50,
      date: '05 Mars 2026',
    ),
  ];

  double getTotal() {
    double total = 0;
    for (var r in reservations) {
      total += r.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: AppBar(
        title: const Text("Historique"),
      ),

      body: reservations.isEmpty
          ? const EmptyHistory()
          : Column(
              children: [

                /// TOTAL
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: theme.cardColor,
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: [

                      Text(
                        "Total dépensé",
                        style: TextStyle(
                          color: theme.textTheme.bodyMedium!.color,
                          fontSize: 16,
                        ),
                      ),

                      Text(
                        "${getTotal().toStringAsFixed(2)} €",
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                /// LISTE
                Expanded(
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16),

                    itemCount: reservations.length,

                    itemBuilder: (context, index) {
                      return ReservationCard(
                        reservation: reservations[index],
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

class Reservation {

  final String type;
  final String stationStart;
  final String stationEnd;
  final String duration;
  final double price;
  final String date;

  const Reservation({
    required this.type,
    required this.stationStart,
    required this.stationEnd,
    required this.duration,
    required this.price,
    required this.date,
  });
}

class ReservationCard extends StatelessWidget {

  final Reservation reservation;

  const ReservationCard({
    super.key,
    required this.reservation,
  });

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Container(

      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// HEADER
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              Row(
                children: [

                  Icon(
                    Icons.pedal_bike,
                    color: theme.colorScheme.primary,
                  ),

                  const SizedBox(width: 8),

                  Text(
                    reservation.type,
                    style: TextStyle(
                      color:
                          theme.textTheme.bodyMedium!.color,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Text(
                reservation.date,
                style: TextStyle(
                  color:
                      theme.textTheme.bodyMedium!.color!
                          .withOpacity(0.6),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          /// TRAJET
          Row(
            children: [

              Icon(
                Icons.location_on,
                color: theme.colorScheme.primary,
              ),

              const SizedBox(width: 8),

              Expanded(
                child: Text(
                  "${reservation.stationStart} → ${reservation.stationEnd}",
                  style: TextStyle(
                    color:
                        theme.textTheme.bodyMedium!.color,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// FOOTER
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              Row(
                children: [

                  Icon(
                    Icons.timer,
                    color:
                        theme.textTheme.bodyMedium!.color!
                            .withOpacity(0.6),
                  ),

                  const SizedBox(width: 6),

                  Text(
                    reservation.duration,
                    style: TextStyle(
                      color:
                          theme.textTheme.bodyMedium!.color,
                    ),
                  ),
                ],
              ),

              Text(
                "${reservation.price} €",
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center,

        children: [

          Icon(
            Icons.history,
            size: 80,
            color:
                theme.textTheme.bodyMedium!.color!
                    .withOpacity(0.5),
          ),

          const SizedBox(height: 20),

          Text(
            "Aucune réservation",
            style: TextStyle(
              color:
                  theme.textTheme.bodyMedium!.color,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            "Vos trajets apparaîtront ici",
            style: TextStyle(
              color:
                  theme.textTheme.bodyMedium!.color!
                      .withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}