import 'package:flutter/material.dart';

import '../options/langue_option.dart';
import '../options/theme_option.dart';
import '../options/notifications_option.dart';
import '../options/mot_de_passe_option.dart';
import '../options/verification_email_option.dart';
import '../options/conditions_option.dart';
import '../options/support_option.dart';
import '../options/apropos_option.dart';

class ParametrePage extends StatelessWidget {
  const ParametrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Paramètres")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Langue"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LangueOption()),
            ),
          ),
          ListTile(
            title: const Text("Mode sombre / clair"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ThemeOption()),
            ),
          ),
          ListTile(
            title: const Text("Notifications"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NotificationsOption()),
            ),
          ),
          ListTile(
            title: const Text("Changer mot de passe"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MotDePasseOption()),
            ),
          ),
          ListTile(
            title: const Text("Vérification email"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const VerificationEmailOption()),
            ),
          ),
          ListTile(
            title: const Text("Conditions d'utilisation"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ConditionsOption()),
            ),
          ),
          ListTile(
            title: const Text("Support"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SupportOption()),
            ),
          ),
          ListTile(
            title: const Text("À propos de l'application"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AproposOption()),
            ),
          ),
        ],
      ),
    );
  }
}