// lib/sms_center_screen.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SmsCenterScreen extends StatelessWidget {
  // Phone number for SMS
  final String smsNumber = "081990090304"; // Replace with your desired number

  void _launchSms() async {
    final url = "sms:$smsNumber?body=Hello"; // Pre-fill the SMS body with "Hello"
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SMS Center')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Kirim SMS ke: $smsNumber',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _launchSms,
              child: Text('Kirim SMS'),
            ),
          ],
        ),
      ),
    );
  }
}
