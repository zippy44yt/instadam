import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLiked = false; // Estat inicial del "like"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFFCAB2EC),
      ),
      body: Center( // Centra el contingut
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileDescription(
              user: 'Pau',
              description: 'Welcome to my profile!',
            ),
            SizedBox(height: 20),
            _buildLikeButton(), // Botó de "m'agrades"
          ],
        ),
      ),
    );
  }

  // Mètode per construir el botó de "m'agrades"
  Widget _buildLikeButton() {
    return IconButton(
      icon: Icon(
        _isLiked ? Icons.favorite : Icons.favorite_border, // Canvia l'icona segons l'estat
        size: 38,
      ),
      onPressed: _profileLikes, // Crida al mètode _profileLikes
    );
  }

  // Mètode per gestionar l'estat del "like"
  void _profileLikes() {
    setState(() {
      _isLiked = !_isLiked; // Commutar l'estat de _isLiked
    });
  }
}

// Classe per la descripció del perfil
class ProfileDescription extends StatelessWidget {
  final String user; // Nom de l'usuari
  final String description; // Descripció del perfil

  // Constructor de la classe
  const ProfileDescription({required this.user, required this.description}); // Usar required

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            user,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            description,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
