// lib/location_screen.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationScreen extends StatelessWidget {
  final String _googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=Bandungrejo,Mranggen,Demak';

  // Fungsi untuk membuka Google Maps
  void _openMaps() async {
    if (await canLaunch(_googleMapsUrl)) {
      await launch(_googleMapsUrl);
    } else {
      throw 'Could not launch $_googleMapsUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lokasi/Maps')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lokasi UMKM Warung Ajib: Bandungrejo, Mranggen, Demak',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openMaps,
              child: Text('Buka di Google Maps'),
            ),
          ],
        ),
      ),
    );
  }
}
