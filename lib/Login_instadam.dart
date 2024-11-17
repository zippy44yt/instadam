import 'package:flutter/material.dart';
import 'package:myapp2/Register_intadam.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sessió'),
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/flutter_logo.gif', height: 200),
            SizedBox(height: 20),
            Text(
              'InstaDam',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Text(
              'Captura y comparte los momentos del mundo',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Usuari',
                border: OutlineInputBorder(),
                hintText: 'Introdueix el teu Usuari',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Contrasenya',
                border: OutlineInputBorder(),
                hintText: 'Introdueix la teva Contrasenya',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Text introduït: ${_controller.text}');
              },
              child: Text('Iniciar Sessió'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navega a la pantalla de registro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              child: Text('Registrate'),
            ),
          ],
        ),
      ),
    );
  }
}

