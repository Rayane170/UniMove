import 'package:flutter/material.dart';
import 'features  /auth        /presentation/pages   /login_page.dart'; 
import 'features  /home        /presentation/pages   /student_main_page.dart';
import 'features  /home        /presentation/pages   /home_page.dart';
import 'features  /reservation /presentation/pages   /reservation_page.dart';
import 'features  /historique  /presentation/pages   /historique_page.dart';
import 'features  /profil      /presentation/pages   /profile_page.dart';
import 'features  /parametres  /presentation/pages   /parametres_page.dart';

 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniMove',
      theme: ThemeData(
        primaryColor: const Color(0xFF3D3C3B),
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const StudentMainPage(), // ← ici on met la page principale avec la BottomNavigationBar
    );
  }
}
