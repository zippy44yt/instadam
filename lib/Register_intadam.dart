
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SignUpScreen> {
  final TextEditingController _controller = TextEditingController(); // Controlador para el TextField

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar-sé'),
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Asegúrate de que la ruta de la imagen sea correcta
            Image.asset('assets/images/flutter_logo.gif', height: 200),
            SizedBox(height: 20), // Espacio entre la imagen y el texto
            Text(
              'InstaDam',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            Text(
              'Captura y comparte los momentos del mundo ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
        SizedBox(height: 6),
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: 'Nom',
            border: OutlineInputBorder(),
            hintText: 'Introdueix el teu Nom',
          ),
        ),
            SizedBox(height: 6),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Cognom',
                border: OutlineInputBorder(),
                hintText: 'Introdueix el teu primer Cognom',
              ),
            ),
            SizedBox(height: 6),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nom de Usuarí',
                border: OutlineInputBorder(),
                hintText: 'Introdueix el teu Nom de Usuarí',
              ),
            ),
            SizedBox(height: 6),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Contrasenya',
                border: OutlineInputBorder(),
                hintText: 'Introdueix la teva Contrasenya',
              ),
            ),
            SizedBox(height: 6),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Contrasenya',
                border: OutlineInputBorder(),
                hintText: 'Confirma la teva Contrasenya',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Acción del botón
                print('Text introduït: ${_controller.text}');
              },
              child: Text('Comprovar Credenciales'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Acción del botón
                print('Text introduït: ${_controller.text}');
              },
              child: Text('Registrat'),
            ),

          ],
        ),
      ),
    );
  }
}
