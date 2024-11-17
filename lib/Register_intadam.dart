import 'package:flutter/material.dart';

import 'main_page_instadam.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar-se'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/instadam_logo.png', height: 200),
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
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nom',
                border: OutlineInputBorder(),
                hintText: 'Introdueix el teu Nom',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _surnameController,
              decoration: InputDecoration(
                labelText: 'Cognom',
                border: OutlineInputBorder(),
                hintText: 'Introdueix el teu Cognom',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Nom d’Usuari',
                border: OutlineInputBorder(),
                hintText: 'Introdueix el teu Usuari',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contrasenya',
                border: OutlineInputBorder(),
                hintText: 'Introdueix la teva Contrasenya',
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirma la teva Contrasenya',
                border: OutlineInputBorder(),
                hintText: 'Confirma la teva Contrasenya',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validaciones antes de redirigir a la pantalla principal
                if (_nameController.text.isNotEmpty &&
                    _surnameController.text.isNotEmpty &&
                    _usernameController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty &&
                    _passwordController.text ==
                        _confirmPasswordController.text) {
                  // Navegar a la pantalla principal
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainPageInstaDam()),
                  );
                } else {
                  // Mostrar un mensaje de error si los datos no son válidos
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Por favor, completa todos los campos correctamente.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text('Registrat'),
            ),
          ],
        ),
      ),
    );
  }
}
