import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'main_page_instadam.dart';

class NewPhoto extends StatefulWidget {
  @override
  _NewPhotoState createState() => _NewPhotoState();
}

class _NewPhotoState extends State<NewPhoto> {
  File? _image;
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _uploadPhoto() {
    if (_image != null && _descriptionController.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPageInstaDam()),
      );
    } else {
      print('Faltan datos. Asegúrate de seleccionar una imagen y escribir una descripción.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subir Foto'),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image == null
                  ? Text('No has seleccionado ninguna imagen.')
                  : Image.file(
                _image!,
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickImage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                child: Text(
                  'Seleccionar Imagen',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                  hintText: 'Escribe algo sobre la foto...',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _uploadPhoto,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                child: Text(
                  'Subir Foto',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
