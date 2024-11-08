import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xFFCAB2EC),
      ),
      body: Center(
        child: Text(
          'Aquesta és la pantalla de configuració.',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
