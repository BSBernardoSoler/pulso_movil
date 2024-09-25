import 'package:flutter/material.dart';
import 'package:pulso_movil/LoginRegistro.dart';
import 'package:pulso_movil/RegistroLogin.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Fondo de color sólido con ilustración
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondoLogin.png'), // Asegúrate de incluir la imagen correcta en assets
                fit: BoxFit.cover, // Cubre toda la pantalla
              ),
            ),
          ),

          // Contenido encima del fondo
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Espacio en la parte superior
                SizedBox(height: 500), // Ajusta la altura según sea necesario

                // Botón de inicio de sesión
                ElevatedButton(
                  onPressed: () {
                    // Navegar a la vista de LoginRegistro
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginRegistro()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Color de fondo del botón
                    foregroundColor: Colors.black, // Color del texto
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Bordes redondeados más pequeños
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50), // Espaciado interno
                  ),
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Espacio entre el botón y el texto
                SizedBox(height: 20),

                // Texto de "Don't have an account? Sign up"
                Column(
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navegar a la vista de Registro
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Registrologin()),
                        );
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.tealAccent,
                          decoration: TextDecoration.underline,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
