class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nom : Rayane Taleb", style: TextStyle(fontSize: 18)),
          Text("Matricule : UO20250123", style: TextStyle(fontSize: 18)),
          Text("Trajets : 34", style: TextStyle(fontSize: 18)),
          Text("CO2 économisé : 8.3 kg", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: () {}, child: const Text("Modifier profil")),
          ElevatedButton(onPressed: () {}, child: const Text("Ajouter carte")),
          ElevatedButton(onPressed: () {}, child: const Text("Voir historique")),
          ElevatedButton(onPressed: () {}, child: const Text("Se déconnecter")),
        ],
      ),
    );
  }
}