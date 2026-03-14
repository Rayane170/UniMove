import 'package:flutter/material.dart';
import '../../../../../features/home/presentation/pages/home_page.dart';
import '../../../../../features/reservasion/presentation/pages/reservasion_page.dart';
import '../../../../../features/historique/presentation/pages/historique_page.dart';
import '../../../../../features/profil/presentation/pages/profil_page.dart';
import '../../../../../features/parametre/presentation/pages/parametre_page.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),

    const ReservasionPage(
      vehicleType: "velo",
      stationName: "Aucune station",
    ),

    const HistoriquePage(),
    const ProfilPage(),
  ];

  final List<String> _titles = [
    "Accueil",
    "Réservation",
    "Historique",
    "Profil",
  ];

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Scaffold(

      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: AppBar(
        elevation: 0,

        backgroundColor: theme.scaffoldBackgroundColor,

        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,

        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ParametrePage(),
                ),
              );
            },
          ),
        ],
      ),

      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: _pages[_currentIndex],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,

        type: BottomNavigationBarType.fixed,

        backgroundColor: theme.cardColor,

        selectedItemColor:
            theme.colorScheme.primary,

        unselectedItemColor:
            theme.textTheme.bodyMedium!.color!
                .withOpacity(0.6),

        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold),

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Accueil",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bike_outlined),
            activeIcon: Icon(Icons.directions_bike),
            label: "Réservation",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            activeIcon: Icon(Icons.history),
            label: "Historique",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}