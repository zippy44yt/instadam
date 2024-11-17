import 'package:flutter/material.dart';

class NewPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Foto'),
      ),
      body: Center(
        child: Text(
          'Pantalla para Subir Nueva Foto',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
