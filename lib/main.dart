import 'package:flutter/material.dart';
import 'package:pulso_movil/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulso App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstView(),
      routes: {
        '/login.dart': (context) => LoginView(),
      },
    );
  }
}

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Color de fondo blanco
      body: InkWell(
        // InkWell proporciona la capacidad de respuesta táctil con efecto de tinta
        onTap: () {
          // Navega a la vista de login al hacer clic en cualquier parte de la pantalla
          Navigator.pushNamed(context, '/login.dart');
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logo.png'), // Inserta aquí la imagen del logo
              SizedBox(height: 20),
              Text(
                'Bienvenido a la App Pulso',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
