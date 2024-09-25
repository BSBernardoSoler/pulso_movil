import 'package:flutter/material.dart';
import 'package:pulso_movil/Inicio.dart';
import 'package:pulso_movil/RegistroLogin.dart';

/// Widget principal de la aplicación que muestra la pantalla de login
class LoginRegistro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Ocultar banner de modo debug
      home: LoginScreen(), // Pantalla de login
    );
  }
}

/// Pantalla de login con campos de email y contraseña
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Color de fondo blanco
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0), // Padding lateral
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrar verticalmente
          crossAxisAlignment: CrossAxisAlignment.stretch, // Ocupar todo el ancho
          children: <Widget>[
            /// Logo centrado en la parte superior
            Center(
              child: Container(
                width: 220, // Ajuste del ancho del cuadrado (equivalente a un radius de 80)
                height: 220, // Ajuste de la altura del cuadrado
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo.png'), // Ruta de la imagen del logo
                    fit: BoxFit.cover, // Ajustar la imagen dentro del contenedor
                  ),
                  borderRadius: BorderRadius.circular(20), // Esquinas ligeramente redondeadas (opcional)
                ),
              ),
            ),
            SizedBox(height: 18), // Espacio entre el logo y el texto
            /// Texto de bienvenida
            Text(
              'Bienvenido!',
              textAlign: TextAlign.center, // Centrar el texto
              style: TextStyle(
                fontSize: 28, // Tamaño del texto ajustado (antes 32)
                fontWeight: FontWeight.bold, // Texto en negrita
              ),
            ),
            SizedBox(height: 16), // Espacio entre el texto y el campo de email
            /// Campo de texto para el email
            TextField(
              decoration: InputDecoration(
                labelText: 'Email', // Etiqueta de texto
                border: OutlineInputBorder(), // Borde alrededor del campo
              ),
            ),
            SizedBox(height: 16), // Espacio entre los campos de email y contraseña
            /// Campo de texto para la contraseña
            TextField(
              obscureText: true, // Ocultar texto al escribir (para contraseñas)
              decoration: InputDecoration(
                labelText: 'Password', // Etiqueta de texto
                border: OutlineInputBorder(), // Borde alrededor del campo
                suffixIcon: Icon(Icons.visibility), // Icono de visibilidad
              ),
            ),
            SizedBox(height: 16), // Espacio antes del botón "INGRESAR"
            /// Botón de ingresar
            ElevatedButton(
              onPressed: () {
                // Navegar a la pantalla de inicio
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Inicio()), // Página de destino
                );
              },
              child: Text('INGRESAR'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15), // Espaciado del botón
              ),
            ),
            SizedBox(height: 16), // Espacio antes del texto "OR"
            /// Línea divisoria con texto "or"
            Row(
              children: <Widget>[
                Expanded(child: Divider()), // Línea divisoria a la izquierda
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('or'), // Texto "or" entre las líneas divisorias
                ),
                Expanded(child: Divider()), // Línea divisoria a la derecha
              ],
            ),
            SizedBox(height: 16), // Espacio antes de los iconos de redes sociales
            /// Iconos de redes sociales para login
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centrar horizontalmente
              children: <Widget>[
                IconButton(
                  icon: Image.asset('assets/facebook.png', height: 40, width: 40), // Icono de Facebook ajustado
                  onPressed: () {}, // Acción para Facebook
                ),
                IconButton(
                  icon: Image.asset('assets/google.png', height: 40, width: 40), // Icono de Google ajustado
                  onPressed: () {}, // Acción para Google
                ),
                IconButton(
                  icon: Image.asset('assets/iphone.png', height: 50, width: 40), // Icono de Apple ajustado
                  onPressed: () {}, // Acción para Apple
                ),
              ],
            ),
            SizedBox(height: 24), // Espacio antes del texto de registro
            /// Texto para crear una nueva cuenta
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Centrar horizontalmente
              children: <Widget>[
                Text("Don't have an account? "), // Texto de pregunta
                GestureDetector(
                  onTap: () {
                    // Navegar a la pantalla de registro
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registrologin()), // Lleva al usuario a la pantalla de registro
                    );
                  },
                  child: Text(
                    'Sign up', // Texto para registro
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Texto en negrita
                      color: Colors.blue, // Texto en azul
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
