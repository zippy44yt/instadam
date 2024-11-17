import 'package:flutter/material.dart';
import 'dart:io'; // Para manejar archivos de imágenes

class NewPhoto extends StatefulWidget {
  @override
  _NewPhotoState createState() => _NewPhotoState();
}

class _NewPhotoState extends State<NewPhoto> {
  File? _image; // Para almacenar la imagen seleccionada
  final TextEditingController _descriptionController = TextEditingController();

  // Función para seleccionar una imagen desde la galería
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery); // Selecciona desde la galería

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Almacena la imagen seleccionada
      });
    }
  }

  // Función para manejar el botón de subir foto (por ahora solo imprime la descripción y la imagen)
  void _uploadPhoto() {
    if (_image != null && _descriptionController.text.isNotEmpty) {
      print('Foto subida: ${_image!.path}');
      print('Descripción: ${_descriptionController.text}');
      // Aquí podrías implementar la lógica para subir la foto a un servidor o almacenarla en Firebase
      // Luego podrías mostrar un mensaje de éxito o navegar a otra pantalla
    } else {
      print('Faltan datos. Asegúrate de seleccionar una imagen y escribir una descripción.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subir Foto'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mostrar la imagen seleccionada si existe
            _image == null
                ? Text('No has seleccionado ninguna imagen.')
                : Image.file(
              _image!,
              height: 300, // Ajusta el tamaño de la imagen
              width: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage, // Botón para seleccionar una imagen
              child: Text('Seleccionar Imagen'),
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
              onPressed: _uploadPhoto, // Botón para subir la foto
              child: Text('Subir Foto'),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageSource {
  static var gallery;
}

class ImagePicker {
  pickImage({required source}) {}
}
