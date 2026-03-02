
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const LatLng _center = LatLng(35.7050, -0.6350);

  late GoogleMapController mapController;

  late BitmapDescriptor stationIcon;
  late BitmapDescriptor univIcon;
  late BitmapDescriptor resIcon;

  Map<String, dynamic>? selectedLocation;
  String searchText = "";

  final List<Map<String, dynamic>> locations = [
    {'name': 'Station USTO', 'lat': 35.7060, 'lng': -0.6190, 'type': 'station', 'velo': 2, 'trot': 4},
    {'name': 'Station Belgaid', 'lat': 35.7230, 'lng': -0.6030, 'type': 'station', 'velo': 2, 'trot': 4},
    {'name': 'Station Centre Ville', 'lat': 35.6975, 'lng': -0.6350, 'type': 'station', 'velo': 2, 'trot': 4},
    {'name': 'Station Gambetta', 'lat': 35.7040, 'lng': -0.6400, 'type': 'station', 'velo': 2, 'trot': 4},
    {'name': 'Station Maraval', 'lat': 35.7150, 'lng': -0.6300, 'type': 'station', 'velo': 2, 'trot': 4},
    {'name': 'Station Akid Lotfi', 'lat': 35.7090, 'lng': -0.6200, 'type': 'station', 'velo': 2, 'trot': 4},
    {'name': 'Station El Bahia', 'lat': 35.7020, 'lng': -0.6450, 'type': 'station', 'velo': 2, 'trot': 4},
    {'name': 'Station Hai Yasmine', 'lat': 35.7180, 'lng': -0.6120, 'type': 'station', 'velo': 2, 'trot': 4},
    {'name': 'Station Medina Jdida', 'lat': 35.6990, 'lng': -0.6370, 'type': 'station', 'velo': 2, 'trot': 4},
    {'name': 'Université Oran 1', 'lat': 35.6910, 'lng': -0.6410, 'type': 'universite'},
    {'name': 'USTO MB', 'lat': 35.7060, 'lng': -0.6190, 'type': 'universite'},
    {'name': 'Université Oran 2', 'lat': 35.7120, 'lng': -0.6220, 'type': 'universite'},
    {'name': 'Résidence Belgaid', 'lat': 35.7230, 'lng': -0.6030, 'type': 'residence'},
    {'name': 'Résidence El Barki', 'lat': 35.7080, 'lng': -0.6180, 'type': 'residence'},
  ];

  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadIcons();
  }

  Future<void> _loadIcons() async {
    stationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(40, 40)), 'assets/icons/station.png');
    univIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(40, 40)), 'assets/icons/univ.png');
    resIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(40, 40)), 'assets/icons/res.png');

    _createMarkers();
    setState(() {});
  }

  void _createMarkers() {
    _markers.clear();
    for (var loc in locations) {
      _markers.add(
        Marker(
          markerId: MarkerId(loc['name']),
          position: LatLng(loc['lat'], loc['lng']),
          infoWindow: InfoWindow(title: loc['name']),
          icon: loc['type'] == 'station'
              ? stationIcon
              : loc['type'] == 'universite'
                  ? univIcon
                  : resIcon,
          onTap: () => _selectLocation(loc),
        ),
      );
    }
    setState(() {});
  }

  void _selectLocation(Map<String, dynamic> loc) {
    setState(() {
      selectedLocation = loc;
    });

    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(loc['lat'], loc['lng']), zoom: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredLocations = locations
        .where((loc) => loc['name'].toLowerCase().contains(searchText))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Accueil"),
        backgroundColor: const Color(0xFF3D3C3B),
        foregroundColor: Colors.white,
      ),
      body: Column(


children: [
          Expanded(
            flex: 6,
            child: GoogleMap(
              onMapCreated: (controller) => mapController = controller,
              initialCameraPosition: const CameraPosition(target: _center, zoom: 13),
              markers: _markers,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.grey.shade900,
              child: Column(
                children: [

                  // ===== COMPTEUR =====
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3D3C3B),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: selectedLocation != null &&
                              selectedLocation!['type'] == 'station'
                          ? Row(
                              children: [

                                // VELO
                                Expanded(
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 15),
                                      Image.asset(
                                        'assets/icons/velo.png',
                                        width: 100,
                                        height: 100,
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${selectedLocation!['velo'] ?? 0}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Text(
                                            "Vélo",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  width: 1,
                                  height: 70,
                                  color: Colors.white24,
                                ),

                                // TROTTINETTE
                                Expanded(
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 15),
                                      Image.asset(
                                        'assets/icons/tro.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        mainAxisAlignment : MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.end,

                                       children: [
                                          Text(
                                            "${selectedLocation!['trot'] ?? 0}",
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Text(
                                            "Trottinette",
                                             textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : const Center(
                              child: Text(
                                "Sélectionnez une station",
                                style: TextStyle(color: Colors.white, fontSize: 18),
                              ),
                            ),
                    ),
                  ),

                  // ===== RECHERCHE =====
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Rechercher...",
                          hintStyle: const TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.grey.shade800,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchText = value.toLowerCase();
                          });
                        },
                      ),
                    ),
                  ),

                  // ===== LISTE =====
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: filteredLocations.length,
                      itemBuilder: (context, index) {
                        final loc = filteredLocations[index];
                        bool isSelected = selectedLocation == loc;
                        return GestureDetector(
                          onTap: () => _selectLocation(loc),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF6ABF4B)
                                  : Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(


                                loc['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // ===== BOUTON =====
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6ABF4B),
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: selectedLocation != null &&
                                selectedLocation!['type'] == 'station'
                            ? () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Réservation effectuée ✅")),
                                );
                              }
                            : null,
                        child: const Text(
                          "Réserver",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}