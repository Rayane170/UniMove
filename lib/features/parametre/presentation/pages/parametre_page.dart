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

    final theme = Theme.of(context);

    final compteOptions = [
      _Option("Changer mot de passe", const MotDePasseOption(), Icons.lock_outline),
      _Option("Vérification email", const VerificationEmailOption(), Icons.verified_outlined),
    ];

    final appOptions = [
      _Option("Langue", const LangueOption(), Icons.language_outlined),
      _Option("Mode sombre / clair", const ThemeOption(), Icons.dark_mode_outlined),
      _Option("Notifications", const NotificationsOption(), Icons.notifications_none),
    ];

    final supportOptions = [
      _Option("Conditions d'utilisation", const ConditionsOption(), Icons.description_outlined),
      _Option("Support", const SupportOption(), Icons.support_agent_outlined),
      _Option("À propos de l'application", const AproposOption(), Icons.info_outline),
    ];

    return Scaffold(

      backgroundColor: theme.scaffoldBackgroundColor,

      appBar: AppBar(
        title: const Text("Paramètres"),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
      ),

      body: ListView(
        children: [

          _SectionTitle("Compte"),
          ...compteOptions.map((o) => _OptionTile(option: o)),

          _SectionTitle("Application"),
          ...appOptions.map((o) => _OptionTile(option: o)),

          _SectionTitle("Support"),
          ...supportOptions.map((o) => _OptionTile(option: o)),

          const SizedBox(height: 20),

          Center(
            child: Text(
              "Version 1.0.0",
              style: TextStyle(
                color: theme.textTheme.bodyMedium!.color!
                    .withOpacity(0.6),
              ),
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {

  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
      child: Text(
        title,
        style: TextStyle(
          color: theme.textTheme.bodyMedium!.color!
              .withOpacity(0.6),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {

  final _Option option;

  const _OptionTile({required this.option});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Card(

      color: theme.cardColor,

      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),

      child: ListTile(

        leading: Icon(
          option.icon,
          color: theme.colorScheme.primary,
        ),

        title: Text(
          option.title,
          style: TextStyle(
            color: theme.textTheme.bodyMedium!.color,
          ),
        ),

        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: theme.textTheme.bodyMedium!.color!
              .withOpacity(0.6),
        ),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => option.page,
            ),
          );
        },
      ),
    );
  }
}

class _Option {

  final String title;
  final Widget page;
  final IconData icon;

  _Option(this.title, this.page, this.icon);
}