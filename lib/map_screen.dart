import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map of Rides and Gardens'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(51.4051,
              0.5124), // Initial map center (replace with actual coordinates)
          zoom: 12.0, // Initial zoom level
        ),
        mapType:
            MapType.normal, // Map type (normal, satellite, terrain, hybrid)
        onMapCreated: (GoogleMapController controller) {
          // Callback function invoked when the map is created
          // You can use the controller to interact with the map
        },
      ),
    );
  }
}
