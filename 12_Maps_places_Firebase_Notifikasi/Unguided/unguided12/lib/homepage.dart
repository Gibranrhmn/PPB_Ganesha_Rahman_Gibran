import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart'; // Tambahkan import ini

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final LatLng _kMapCenter = const LatLng(19.018255973653343, 72.84793849278007);
  final CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(19.018255973653343, 72.84793849278007),
    zoom: 11.0,
  );

  void _openPlacePicker() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKey: "AIzaSyAGGWpKtY5qUPOIyP_CAQUXD6XeYxdf-e0", // Ganti dengan API key Anda
        ),
      ),
    );

    if (result != null) {
      final pickedLocation = result.latLng;
      // Gunakan lokasi yang dipilih
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Lokasi dipilih: ${pickedLocation.latitude}, ${pickedLocation.longitude}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps & Place Picker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.place),
            onPressed: _openPlacePicker,
          ),
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        myLocationEnabled: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openPlacePicker,
        child: const Icon(Icons.search),
      ),
    );
  }
}
