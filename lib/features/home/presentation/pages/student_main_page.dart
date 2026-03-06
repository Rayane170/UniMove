import 'package:flutter/material.dart';

import 'home_page.dart';
import 'package:unimove/features/reservation/presentation/pages/reservation_page.dart';
import 'package:unimove/features/historique/presentation/pages/historique_page.dart';
import 'package:unimove/features/profil/presentation/pages/profile_page.dart';
import 'package:unimove/features/parametres/presentation/pages/parametres_page.dart';

class StudentMainPage extends StatefulWidget {
  const StudentMainPage({super.key});

  @override
  State<StudentMainPage> createState() => _StudentMainPageState();
}

class _StudentMainPageState extends State<StudentMainPage> {
  int _currentIndex = 0;

  // Liste des pages côté étudiant ===============================================================================================

final List<Widget> _pages = [
  const HomePage(),
  const ReservationPage(),
  const HistoriquePage(),
  const ProfilePage(),
  const ParametresPage(),
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