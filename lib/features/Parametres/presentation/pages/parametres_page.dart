import 'package:flutter/material.dart';
import 'features/parametres/presentation/options/language_page.dart';
import 'features/parametres/presentation/options/theme_page.dart';
import 'features/parametres/presentation/options/notifications_page.dart';
import 'features/parametres/presentation/options/change_password_page.dart';
import 'features/parametres/presentation/options/email_verification_page.dart';
import 'features/parametres/presentation/options/terms_page.dart';
import 'features/parametres/presentation/options/support_page.dart';
import 'features/parametres/presentation/options/about_page.dart';

class ParametresPage extends StatelessWidget {
  const ParametresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paramètres"),
      ),
      body: ListView(
        children: [

          ListTile(
            title: const Text("Langue"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LangueOption()),
              );
            },
          ),

          ListTile(
            title: const Text("Mode sombre / clair"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ThemeOption()),
              );
            },
          ),

          ListTile(
            title: const Text("Notifications"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationsOption()),
              );
            },
          ),

          ListTile(
            title: const Text("Changer mot de passe"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const MotDePasseOption()),
              );
            },
          ),

          ListTile(
            title: const Text("Vérification email"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const VerificationEmailOption()),
              );
            },
          ),

          ListTile(
            title: const Text("Conditions d'utilisation"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ConditionsOption()),
              );
            },
          ),

          ListTile(
            title: const Text("Support"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SupportOption()),
              );
            },
          ),

          ListTile(
            title: const Text("À propos de l'application"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AproposOption()),
              );
            },
          ),

        ],
      ),
    );
  }
}