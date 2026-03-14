import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: AppBar(
        title: const Text("Profil"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            /// CARD PROFIL
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                children: [

                  CircleAvatar(
                    radius: 40,
                    backgroundColor:
                        theme.colorScheme.primary,

                    child: const Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Rayane Taleb",
                    style: TextStyle(
                      fontSize: 20,
                      color:
                          theme.textTheme.bodyMedium!.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "Matricule : UO20250123",
                    style: TextStyle(
                      color:
                          theme.textTheme.bodyMedium!.color!
                              .withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// STATS
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                _statCard(
                  context,
                  "Trajets",
                  "34",
                  Icons.route,
                ),

                _statCard(
                  context,
                  "CO2",
                  "8.3 kg",
                  Icons.eco,
                ),
              ],
            ),

            const SizedBox(height: 30),

            /// ACTIONS

            _actionButton(
              context,
              Icons.edit,
              "Modifier profil",
            ),

            const SizedBox(height: 10),

            _actionButton(
              context,
              Icons.credit_card,
              "Ajouter carte",
            ),

            const SizedBox(height: 10),

            _actionButton(
              context,
              Icons.history,
              "Voir historique",
            ),

            const SizedBox(height: 10),

            _actionButton(
              context,
              Icons.logout,
              "Se déconnecter",
            ),
          ],
        ),
      ),
    );
  }

  /// STAT CARD
  static Widget _statCard(
    BuildContext context,
    String titre,
    String valeur,
    IconData icon,
  ) {

    final theme = Theme.of(context);

    return Expanded(
      child: Container(
        margin:
            const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(20),

        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          children: [

            Icon(
              icon,
              color: theme.colorScheme.primary,
              size: 28,
            ),

            const SizedBox(height: 10),

            Text(
              valeur,
              style: TextStyle(
                fontSize: 18,
                color:
                    theme.textTheme.bodyMedium!.color,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              titre,
              style: TextStyle(
                color:
                    theme.textTheme.bodyMedium!.color!
                        .withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// BUTTON
  static Widget _actionButton(
    BuildContext context,
    IconData icon,
    String text,
  ) {

    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: 55,

      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(15),
      ),

      child: Row(
        children: [

          const SizedBox(width: 15),

          Icon(
            icon,
            color: theme.colorScheme.primary,
          ),

          const SizedBox(width: 15),

          Text(
            text,
            style: TextStyle(
              color:
                  theme.textTheme.bodyMedium!.color,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}