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

    {'name': 'Station USTO','lat': 35.7060,'lng': -0.6190,'type': 'station','velo': 2,'trot': 4},
    {'name': 'Station Belgaid','lat': 35.7230,'lng': -0.6030,'type': 'station','velo': 2,'trot': 4},
    {'name': 'Station Centre Ville','lat': 35.6975,'lng': -0.6350,'type': 'station','velo': 2,'trot': 4},
    {'name': 'Station Gambetta','lat': 35.7040,'lng': -0.6400,'type': 'station','velo': 2,'trot': 4},
    {'name': 'Station Maraval','lat': 35.7150,'lng': -0.6300,'type': 'station','velo': 2,'trot': 4},
    {'name': 'Station Akid Lotfi','lat': 35.7090,'lng': -0.6200,'type': 'station','velo': 2,'trot': 4},

    {'name': 'Université Oran 1','lat': 35.6910,'lng': -0.6410,'type': 'universite'},
    {'name': 'USTO MB','lat': 35.7060,'lng': -0.6190,'type': 'universite'},
    {'name': 'Université Oran 2','lat': 35.7120,'lng': -0.6220,'type': 'universite'},

    {'name': 'Résidence Belgaid','lat': 35.7230,'lng': -0.6030,'type': 'residence'},
    {'name': 'Résidence El Barki','lat': 35.7080,'lng': -0.6180,'type': 'residence'},
  ];

  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadIcons();
  }

  Future<void> _loadIcons() async {

    stationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(40, 40)),
        'assets/icons/station.png');

    univIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(40, 40)),
        'assets/icons/univ.png');

    resIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(size: Size(40, 40)),
        'assets/icons/res.png');

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
        CameraPosition(
          target: LatLng(loc['lat'], loc['lng']),
          zoom: 15,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final filteredLocations = locations
        .where((loc) => loc['name'].toLowerCase().contains(searchText))
        .toList();

    return Scaffold(

      body: Stack(
        children: [

          GoogleMap(
            onMapCreated: (controller) => mapController = controller,
            initialCameraPosition:
                const CameraPosition(target: _center, zoom: 13),
            markers: _markers,
          ),

          /// PANNEAU BAS PROFESSIONNEL

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Container(

              padding: const EdgeInsets.symmetric(vertical: 18),

              decoration: const BoxDecoration(
                color: Color(0xFF0F1115),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 15,
                  )
                ]
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  /// BARRE DRAG

                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// SEARCH BAR

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),

                    child: TextField(

                      style: const TextStyle(color: Colors.white),

                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search,color: Colors.white54),
                        hintText: "Rechercher une station...",
                        hintStyle: const TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: const Color(0xFF1B1E24),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
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

                  const SizedBox(height: 15),

                  /// LISTE STATIONS

                  SizedBox(
                    height: 45,

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
                            padding: const EdgeInsets.symmetric(horizontal: 18),

                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF6ABF4B)
                                  : const Color(0xFF1B1E24),
                              borderRadius: BorderRadius.circular(25),
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

                  const SizedBox(height: 18),

                  /// CARTE STATION

                  Container(

                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: const Color(0xFF1B1E24),
                      borderRadius: BorderRadius.circular(25),
                    ),

                    child: Column(
                      children: [

                        Text(
                          selectedLocation?['name'] ??
                              "Sélectionnez une station",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 18),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [

                            _vehicleCounter(
                              "assets/icons/velo.png",
                              selectedLocation?['velo'] ?? 0,
                              "Vélos"
                            ),

                            Container(
                              width: 1,
                              height: 50,
                              color: Colors.white24,
                            ),

                            _vehicleCounter(
                              "assets/icons/tro.png",
                              selectedLocation?['trot'] ?? 0,
                              "Trottinettes"
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  /// BOUTON RESERVER

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),

                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6ABF4B),
                        minimumSize: const Size.fromHeight(55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),

                      onPressed: selectedLocation != null &&
                              selectedLocation!['type'] == 'station'
                          ? () {

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Réservation effectuée ✅"),
                                ),
                              );
                            }
                          : null,

                      child: const Text(
                        "Réserver un véhicule",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _vehicleCounter(String icon,int value,String label){

    return Column(
      children: [

        Image.asset(icon,width:40),

        const SizedBox(height:5),

        Text(
          "$value",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        )
      ],
    );
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }
}