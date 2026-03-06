import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:your_project/features/reservasion/presentation/pages/reservasion_page.dart';
import 'package:your_project/features/historique/presentation/pages/historique_page.dart';
import 'package:your_project/features/profil/presentation/pages/profil_page.dart';
import 'package:your_project/features/parametre/presentation/pages/parametre_page.dart';

class StudentMainPage extends StatefulWidget {
  const StudentMainPage({super.key});

  @override
  State<StudentMainPage> createState() => _StudentMainPageState();
}

class _StudentMainPageState extends State<StudentMainPage> {
  int _currentIndex = 0;

  // Liste des pages côté étudiant ===============================================================================================

  final List<Widget> _pages = [
    const HomePage(),          // Map / Home
    const ReservasionPage(),   // Réservation
    const HistoriquePage(),    // My Reservations / Historique
    const ProfilPage(),        // Profil
    const ParametrePage(),     // Paramètres
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFF3D3C3B),
        selectedItemColor: const Color(0xFF6ABF4B),
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index; 
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
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