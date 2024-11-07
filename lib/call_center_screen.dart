// lib/call_center_screen.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallCenterScreen extends StatelessWidget {
  // Nomor WhatsApp dan pesan yang diinginkan
  final String whatsappNumber = "081990090304"; // Ganti dengan nomor yang diinginkan
  final String message = "Halo, saya butuh bantuan."; // Ganti dengan pesan yang diinginkan

  void _launchWhatsApp() async {
    final url = "https://wa.me/$whatsappNumber?text=${Uri.encodeComponent(message)}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Call Center')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hubungi Call Center di: $whatsappNumber',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _launchWhatsApp,
              child: Text('Chat di WhatsApp'),
            ),
          ],
        ),
      ),
    );
  }
}
