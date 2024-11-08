import 'package:flutter/material.dart';
import 'package:myapp2/Login_instadam.dart';
import 'package:myapp2/Register_intadam.dart';
import 'home_screen.dart'; // Importa la pantalla Home
import 'profile_screen.dart'; // Importa la pantalla Profile
import 'settings_screen.dart'; // Importa la pantalla Settings

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaDam',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BottomNavigationWidget(), // Canviem a BottomNavigationWidget
    );
  }
}

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 1; // Índex inicial
  static List<Widget> _sections = [SignUpScreen(),LoginScreen(),HomeScreen(), ProfileScreen(), SettingsScreen()];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index; // Actualitzem l'índex seleccionat
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _sections[_selectedIndex], // Mostrem la secció basada en l'índex seleccionat
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex, // Índex actual
        onTap: _onItemTap, // Gestor d'events de tap
      ),
    );
  }
}
