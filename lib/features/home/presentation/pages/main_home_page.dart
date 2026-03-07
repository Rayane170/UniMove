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

  // Liste des pages affichées selon l'onglet sélectionné
  final List<Widget> _pages = const [
    HomePage(),
    ReservasionPage(),
    HistoriquePage(),
    ProfilPage(),
  ];

  // Liste des titres pour l'AppBar
  final List<String> _titles = [
    "Accueil",
    "Réservation",
    "Historique",
    "Profil",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Retour ou quitter l'app
            Navigator.pop(context);
          },
        ),
        title: Text(_titles[_currentIndex]),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ParametrePage()),
              );
            },
          ),
        ],
        backgroundColor: const Color(0xFF3D3C3B),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.directions_bike), label: "Réservation"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Historique"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}