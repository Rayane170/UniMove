import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../reservasion/presentation/pages/reservasion_page.dart';

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
  String? selectedVehicle;

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
          icon: loc['type'] == 'station'
              ? stationIcon
              : loc['type'] == 'universite'
              ? univIcon
              : resIcon,
          onTap: () => _selectLocation(loc),
        ),
      );
    }
  }

  void _selectLocation(Map<String, dynamic> loc) {

    setState(() {
      selectedLocation = loc;
      selectedVehicle = null;
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

    final theme = Theme.of(context);

    final filteredLocations = locations
        .where((loc) => loc['name']
        .toLowerCase()
        .contains(searchText))
        .toList();

    return Scaffold(

      backgroundColor: theme.scaffoldBackgroundColor,

      body: Stack(
        children: [

          GoogleMap(
            onMapCreated: (controller) => mapController = controller,
            initialCameraPosition:
            const CameraPosition(target: _center, zoom: 13),
            markers: _markers,
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Container(

              padding: const EdgeInsets.symmetric(vertical: 18),

              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: theme.textTheme.bodyMedium!.color!
                          .withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),

                    child: TextField(

                      style: TextStyle(
                        color: theme.textTheme.bodyMedium!.color,
                      ),

                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: theme.colorScheme.primary,
                        ),
                        hintText: "Rechercher une station...",
                        hintStyle: TextStyle(
                          color: theme.textTheme.bodyMedium!.color!
                              .withOpacity(0.6),
                        ),
                        filled: true,
                      ),

                      onChanged: (value) {
                        setState(() {
                          searchText = value.toLowerCase();
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 15),

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
                            margin:
                            const EdgeInsets.symmetric(horizontal: 8),
                            padding:
                            const EdgeInsets.symmetric(horizontal: 18),

                            decoration: BoxDecoration(
                              color: isSelected
                                  ? theme.colorScheme.primary
                                  : theme.cardColor,
                              borderRadius:
                              BorderRadius.circular(25),
                            ),

                            child: Center(
                              child: Text(
                                loc['name'],
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : theme.textTheme.bodyMedium!.color,
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

                  Container(

                    margin:
                    const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(
                      color: theme.cardColor,
                      borderRadius:
                      BorderRadius.circular(25),
                    ),

                    child: Row(
                      children: [

                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedVehicle = "velo";
                              });
                            },
                            child: _vehicleCounter(
                                context,
                                "assets/icons/velo2.png",
                                selectedLocation?['velo'] ?? 0,
                                selectedVehicle == "velo"),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedVehicle = "trot";
                              });
                            },
                            child: _vehicleCounter(
                                context,
                                "assets/icons/tro.png",
                                selectedLocation?['trot'] ?? 0,
                                selectedVehicle == "trot"),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16),

                    child: ElevatedButton(

                      onPressed: () {

                        if (selectedVehicle == null) return;

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ReservasionPage(
                              vehicleType: selectedVehicle,
                              stationName:
                              selectedLocation?['name'],
                            ),
                          ),
                        );
                      },

                      child: const Text(
                        "Réserver une machine",
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

  Widget _vehicleCounter(
      BuildContext context,
      String icon,
      int value,
      bool selected,
      ) {

    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),

      padding:
      const EdgeInsets.symmetric(horizontal: 25, vertical: 12),

      decoration: BoxDecoration(
        color: selected
            ? theme.colorScheme.primary
            : theme.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset(icon, width: 35),

          const SizedBox(width: 10),

          Text(
            "$value",
            style: TextStyle(
              color: selected
                  ? Colors.white
                  : theme.textTheme.bodyMedium!.color,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }
}