class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(title: Text("Langue")),
        ListTile(title: Text("Mode sombre / clair")),
        ListTile(title: Text("Notifications")),
        ListTile(title: Text("Changer mot de passe")),
        ListTile(title: Text("Vérification email")),
        ListTile(title: Text("Conditions d'utilisation")),
        ListTile(title: Text("Support")),
        ListTile(title: Text("À propos de l'application")),
      ],
    );
  }
}