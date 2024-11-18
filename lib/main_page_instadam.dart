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

  final List<String> imageDescriptions = [
    'Fantástico día en una cala de Benidorm',
    'Disfrutando de los hermosos caminos de EE.UU.',
    'Gran día para pescar',
    'He encontrado este paraíso en el agua',
    'Aquí Primico en el campo',
    'Draw My Mind',
    'Sin Demanda No hay Negocio',
    'Vi este animal en el bosque',
    'Mi pequeño perro y mi nuevo gatito :)',
  ];

  final List<String> headers = [
    'SunnyLand77',
    'RoadRiderhd',
    'Skydiveryt4',
    'Watersites',
    'RaulHernandez01',
    'DrawMYdreams',
    'FrankCustaOfficial',
    'WildForest',
    'PedsStuff',
  ];

  final List<String> profileImages = [
    'assets/profile/profile1.jpeg',
    'assets/profile/profile2.jpeg',
    'assets/profile/profile3.jpeg',
    'assets/profile/profile4.jpeg',
    'assets/profile/profile5.jpeg',
    'assets/profile/profile6.jpeg',
    'assets/profile/profile9.jpeg',
    'assets/profile/profile8.jpeg',
    'assets/profile/profile7.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final containerWidth = constraints.maxWidth;

                  return Column(
                    children: [
                      Container(
                        width: containerWidth,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(profileImages[index]),
                              radius: 20.0,
                            ),
                            SizedBox(width: 4.0),
                            Expanded(
                              child: Text(
                                headers[index],
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          imagePaths[index],
                          fit: BoxFit.cover,
                          height: 250, // Ajusta la altura de la imagen para que se ajuste mejor
                          width: containerWidth,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => ImageDialog(),
                          );
                        },
                        child: Container(
                          width: containerWidth,
                          margin: EdgeInsets.only(top: 10.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white),
                          ),
                          child: Text(
                            imageDescriptions[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
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
      title: Text('Post'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.thumb_up, color: Colors.black),
                onPressed: () {
                  print('Like dado');
                },
              ),
              Text(
                'Like',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Escribe un comentario...',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.pink),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              labelStyle: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cerrar',
            style: TextStyle(color: Colors.pink),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Enviar',
            style: TextStyle(color: Colors.pink),
          ),
        ),
      ],
    );
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 10,
            child: Icon(Icons.home, color: Colors.pink),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 10,
            child: Icon(Icons.person, color: Colors.pink),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 10,
            child: Icon(Icons.settings, color: Colors.pink),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 10,
            child: Icon(Icons.add_a_photo, color: Colors.pink),
          ),
          label: '',
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainPage()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsScreen()),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewPhoto()),
          );
        }
      },
    );
  }
}
