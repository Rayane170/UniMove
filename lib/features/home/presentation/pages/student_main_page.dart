
import 'package:flutter/material.dart';

// Pages principales
import 'home_page.dart';
import '../../../historique/presentation/pages/historique_page.dart';
import '../../../reservasion/presentation/pages/reservasion_page.dart';
import '../../../profil/presentation/pages/profil_page.dart';
import '../../../parametre/presentation/pages/parametre_page.dart';

class StudentMainPage extends StatefulWidget {
  const StudentMainPage({super.key});

  @override
  State<StudentMainPage> createState() => _StudentMainPageState();
}

class _StudentMainPageState extends State<StudentMainPage> {
  int _currentIndex = 0;

  // Liste des pages à afficher
  final List<Widget> _pages = const [
    HomePage(),
    ReservasionPage(),
    HistoriquePage(),
    ProfilPage(),
    ParametrePage(),
  ];

  // Titres pour l'appBar
  final List<String> _titles = const [
    "Accueil",
    "Réservation",
    "Historique",
    "Profil",
    "Paramètres",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        backgroundColor: const Color(0xFF3D3C3B),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF3D3C3B),
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bike),
            label: "Réservation",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "Historique",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Paramètres",
          ),
        ],
      ),
    );
  }
}