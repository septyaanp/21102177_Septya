import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MapController _mapController;
  LatLng _currentPosition = LatLng(
    -7.424563,
    109.239637,
  ); // Telkom University Purwokerto
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _addMarker(_currentPosition, "Telkom University Purwokerto");
  }

  // Mendapatkan lokasi pengguna
  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Cek apakah layanan lokasi aktif
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Lokasi tidak aktif");
      return;
    }

    // Cek dan minta izin lokasi
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        print("Izin lokasi ditolak secara permanen");
        return;
      }
    }

    // Dapatkan lokasi pengguna
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _mapController.move(_currentPosition, 15.0);
    });
  }

  // Menambahkan marker di peta
  void _addMarker(LatLng position, String title) {
    setState(() {
      _markers.add(
        Marker(
          point: position,
          width: 40.0,
          height: 40.0,
          child: Icon(Icons.location_pin, color: Colors.red, size: 40),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("OpenStreetMap - Telkom University Purwokerto"),
          backgroundColor: Colors.green,
        ),
        body: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: _currentPosition,
            initialZoom: 16.0, // Zoom lebih dekat ke kampus
            onTap: (tapPosition, latLng) {
              _addMarker(latLng, "Lokasi Dipilih");
            },
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayer(markers: _markers),
            CurrentLocationLayer(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.my_location),
          onPressed: _getCurrentLocation,
        ),
      ),
    );
  }
}
