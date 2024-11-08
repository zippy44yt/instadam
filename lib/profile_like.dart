import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileLike extends StatefulWidget {
  @override
  _ProfileLikeState createState() => _ProfileLikeState();
}

class _ProfileLikeState extends State<ProfileLike> {
  bool _isLiked = false;

  @override
  void initState() {
    super.initState();
    getLikesValue();
  }

  Future<void> getLikesValue() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLiked = prefs.getBool("liked") ?? false;
    });
  }

  void _profileLikes() async {
    setState(() {
      _isLiked = !_isLiked;
    });
    saveLikes(_isLiked);
  }

  void saveLikes(bool isLiked) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("liked", isLiked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Like'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(_isLiked ? Icons.favorite : Icons.favorite_border, size: 38),
              onPressed: _profileLikes,
            ),
            Text(_isLiked ? 'Te gusta!' : 'No te gusta'),
          ],
        ),
      ),
    );
  }
}
