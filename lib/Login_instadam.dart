import 'package:flutter/material.dart';
import 'package:myapp2/Register_intadam.dart';
import 'main_page_instadam.dart'; // Importa la página principal que quieres redirigir

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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/instadam_logo.png', height: 200),
              SizedBox(height: 20),
              Text(
                'InstaDam',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                'Captura y comparte los momentos del mundo',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Usuari',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  hintText: 'Introdueix el teu Usuari',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.3),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Contrasenya',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                  hintText: 'Introdueix la teva Contrasenya',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.3),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Redirige a la página principal después de iniciar sesión
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainPageInstaDam()), // Cambia a MainPageInstaDam
                  );
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
      ),
    );
  }
}
