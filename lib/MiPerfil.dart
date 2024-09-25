import 'package:flutter/material.dart';

class Miperfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Cuenta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MiCuentaPage(),
    );
  }
}

class MiCuentaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi cuenta'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://example.com/user_image'), // Placeholder image
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mario Castañeda',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Titular',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Mis datos'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Acción al presionar
              },
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Pagos'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Acción al presionar
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Acción al presionar
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Ayuda'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Acción al presionar
              },
            ),
            ListTile(
              leading: Icon(Icons.description),
              title: Text('Términos y condiciones'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Acción al presionar
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('Políticas de privacidad'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Acción al presionar
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Cerrar sesión'),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                // Acción al presionar
              },
            ),
          ],
        ),
      ),
    );
  }
}
