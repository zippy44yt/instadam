import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import 'new_photo.dart';

void main() {
  runApp(MainPageInstaDam());
}

class MainPageInstaDam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaDam',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InstaDam'),
        backgroundColor: Colors.pink,
      ),
      body: MainPageBody(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class MainPageBody extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/imagen1.jpg',
    'assets/images/imagen2.jpg',
    'assets/images/imagen3.jpg',
    'assets/images/imagen4.jpg',
    'assets/images/imagen5.png',
    'assets/images/imagen6.jpg',
    'assets/images/imagen7.jpg',
    'assets/images/imagen8.jpg',
    'assets/images/imagen9.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Crea una cuadrícula de imágenes
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Número de columnas en la cuadrícula
              crossAxisSpacing: 4.0, // Espacio horizontal entre imágenes
              mainAxisSpacing: 4.0, // Espacio vertical entre imágenes
            ),
            itemCount: imagePaths.length, // Número de imágenes
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Acción al tocar la imagen (puedes añadir más detalles si deseas)
                  showDialog(
                    context: context,
                    builder: (context) => ImageDialog(),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    imagePaths[index], // Muestra la imagen correspondiente desde la lista
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ImageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Comentario y Like'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Escribe un comentario...',
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {
                  print('Like dado');
                },
              ),
              Text('Like'),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cerrar'),
        ),
      ],
    );
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Perfil',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configuración',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_a_photo),
          label: 'Nueva Foto', // Cambié el nombre del botón a 'Nueva Foto'
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          // Navega a la pantalla de perfil
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        } else if (index == 1) {
          // Navega a la pantalla de configuración
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsScreen()),
          );
        } else if (index == 2) {
          // Navega a la pantalla de subir fotos
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewPhoto()), // Cambio a NewPhoto
          );
        }
      },
    );
  }
}
