import 'package:flutter/material.dart';
import 'package:myapp2/Login_instadam.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person_outline, color: Colors.black),
            title: Text('Editar perfil'),
            onTap: () {
              // Navega a la pantalla de edición de perfil
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Funcionalidad aún no implementada.'),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock_outline, color: Colors.black),
            title: Text('Cambiar contraseña'),
            onTap: () {
              // Navega a la pantalla para cambiar contraseña
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Funcionalidad aún no implementada.'),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications_outlined, color: Colors.black),
            title: Text('Notificaciones'),
            onTap: () {
              // Navega a la configuración de notificaciones
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Funcionalidad aún no implementada.'),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.privacy_tip_outlined, color: Colors.black),
            title: Text('Privacidad'),
            onTap: () {
              // Navega a la configuración de privacidad
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Funcionalidad aún no implementada.'),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help_outline, color: Colors.black),
            title: Text('Ayuda'),
            onTap: () {
              // Navega a la sección de ayuda
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Funcionalidad aún no implementada.'),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.black),
            title: Text('Información sobre la aplicación'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'InstaDam',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2024 InstaDam Inc.',
                children: [
                  Text(
                    'InstaDam es una aplicación para capturar y compartir momentos.',
                  ),
                ],
              );
            },
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child:  ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                ),
              onPressed: () {
                // Navega a la pantalla de registro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Cerrar sesión'),
            ),
          ),
        ],
      ),
    );
  }
}
