import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile/profile10.jpeg')
              ),
              SizedBox(height: 20),
              ProfileDescription(
                user: 'Zippy44yt',
                description: 'Bienvenido a mi perfil de InstaDam',
              ),
              SizedBox(height: 20),
              _buildLikeButton(),
              SizedBox(height: 30),
              _buildPostCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLikeButton() {
    return IconButton(
      icon: Icon(
        _isLiked ? Icons.favorite : Icons.favorite_border,
        size: 38,
        color: _isLiked ? Colors.red : Colors.grey,
      ),
      onPressed: _profileLikes,
    );
  }

  void _profileLikes() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  Widget _buildPostCard() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mi primera vez usando InstaDam ;) ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset(
              'assets/images/imagen3.jpg',
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

class ProfileDescription extends StatelessWidget {
  final String user;
  final String description;

  const ProfileDescription({required this.user, required this.description});

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
