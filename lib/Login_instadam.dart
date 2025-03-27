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
    //para adaptar a la pantalla
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sessió'),
        backgroundColor: Color(0xFFFFFFFF),
      ),
      body:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.pink.shade200,
                Colors.orange.shade200,
                Colors.yellow.shade200,
              ],
          begin: Alignment.topCenter,
          end:Alignment.bottomLeft,
        ),
      ),
      child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.05),
            Image.asset(
                'assets/images/instadam_logo.png',
                height: screenHeight * 0.25,
            ),
            SizedBox(height: screenHeight * 0.03),
            Text(
              'InstaDam',
              style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.bold,
            ),
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
      )
      )
    );
  }
}
