import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import 'new_photo.dart';  // Importa el archivo actualizado para subir foto

void main() {
  runApp(MainPageInstaDam());
}

class MainPageInstaDam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaDam',
      theme: ThemeData(
        primarySwatch: Colors.red,
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
        backgroundColor: Colors.red,
      ),
      body: MainPageBody(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class MainPageBody extends StatelessWidget {
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
            itemCount: 20, // Número de imágenes
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
                    'assets/images/instadam_logo.png', // Asegúrate de cambiar la imagen
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
