import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Url Launcher"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            launchButton(
              title: 'Launch Phone Number',
              icon: Icons.phone,
              onPressed: () async {
                Uri uri = Uri.parse('tel:+1-555-010-999');
                if (!await launcher.launchUrl(uri)) {
                  debugPrint(
                      "Could not launch the uri"); // because the simulator doesn't has the phone app
                }
              },
            ),
            launchButton(
              title: 'Launch Website / URL',
              icon: Icons.language,
              onPressed: () {
                launcher.launchUrl(
                  Uri.parse('https://flutter.dev'),
                  mode: launcher.LaunchMode.externalApplication,
                );
              },
            ),
            launchButton(
              title: 'Launch SMS / Message',
              icon: Icons.message,
              onPressed: () => launcher.launchUrl(
                Uri.parse(
                  'sms:555010123${Platform.isAndroid ? '?' : '&'}body=Message from flutter app',
                ),
              ),
            ),
            launchButton(
              title: 'Launch Email',
              icon: Icons.email,
              onPressed: () async {
                Uri uri = Uri.parse(
                  'mailto:info@rapidtech.dev?subject=Flutter Url Launcher&body=Hi, Flutter developer',
                );
                if (!await launcher.launchUrl(uri)) {
                  debugPrint(
                      "Could not launch the uri"); // because the simulator doesn't has the email app
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget launchButton({
    required String title,
    required IconData icon,
    required Function() onPressed,
  }) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
