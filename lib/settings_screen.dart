import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Center(
        child: Text(
          'Pantalla de Configuración',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
