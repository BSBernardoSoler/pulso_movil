import 'package:flutter/material.dart';
import 'package:pulso_movil/Consultas.dart';
import 'package:pulso_movil/Historial.dart';
import 'package:pulso_movil/MiPerfil.dart';
import 'package:pulso_movil/Notificaciones.dart';

void main() {
  runApp(Inicio());
}

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulso App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Indice del ítem seleccionado

  // Lista de páginas correspondientes a cada ítem del BottomNavigationBar
  final List<Widget> _pages = [
    HomeContent(), // Página de Inicio
    Consultas(), // Página de Beneficios
    Historial(), // Página de Mi Plan
    Notificaciones(), // Página de Notificaciones
    Miperfil(), // Página de Perfil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Actualiza el índice seleccionado
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pulso App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Muestra la página correspondiente
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Consultas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_travel),
            label: 'Historial',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex, // Indica el índice seleccionado
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped, // Llama a la función al seleccionar un ítem
      ),
    );
  }
}

// Página de contenido de Inicio
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        // Sección con íconos horizontales (categorías)
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Redireccionar a la vista de Embarazo
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EmbarazoPage()));
                },
                child: CategoryIcon(icon: Icons.pregnant_woman, label: 'Embarazo'),
              ),
              GestureDetector(
                onTap: () {
                  // Redireccionar a la vista de Vista
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VistaPage()));
                },
                child: CategoryIcon(icon: Icons.visibility, label: 'Vista'),
              ),
              GestureDetector(
                onTap: () {
                  // Redireccionar a la vista de Audición
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AudicionPage()));
                },
                child: CategoryIcon(icon: Icons.hearing, label: 'Audición'),
              ),
              GestureDetector(
                onTap: () {
                  // Redireccionar a la vista de Corazón
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CorazonPage()));
                },
                child: CategoryIcon(icon: Icons.favorite, label: 'Corazón'),
              ),
              GestureDetector(
                onTap: () {
                  // Redireccionar a la vista de Cerebro
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CerebroPage()));
                },
                child: CategoryIcon(icon: Icons.adb_sharp, label: 'Cerebro'),
              ),
              GestureDetector(
                onTap: () {
                  // Redireccionar a la vista de Dieta
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DietaPage()));
                },
                child: CategoryIcon(icon: Icons.food_bank, label: 'Dieta'),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        // Botón de emergencia
        ElevatedButton(
          onPressed: () {
            // Acción de emergencia
            Navigator.push(context, MaterialPageRoute(builder: (context) => EmergenciaPage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Color llamativo para el botón
            padding: EdgeInsets.symmetric(vertical: 20.0),
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          child: Text('Emergencia'),
        ),
        SizedBox(height: 20),
        // Sección de noticias
        SectionTitle(title: 'Noticias Compensar'),
        NewsCard(
          title: 'Activo por emergencia: Afíliate como beneficiario con UPC adicional.',
          time: 'Hace 12 horas',
          videoDuration: '04:31',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        SizedBox(height: 20),
        // Sección de consejos para la salud
        SectionTitle(title: 'Consejos para la salud'),
        NewsCard(
          title: 'Recomendaciones para un corazón sano',
          time: 'Hace 12 horas',
          videoDuration: '05:14',
          imageUrl: 'https://via.placeholder.com/150',
        ),
        NewsCard(
          title: 'Ejercicios para mantenerte activo',
          time: 'Hace 12 horas',
          videoDuration: '03:45',
          imageUrl: 'https://via.placeholder.com/150',
        ),
      ],
    );
  }
}

// Widget personalizado para íconos de categorías
class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.orange.withOpacity(0.2),
          child: Icon(
            icon,
            color: Colors.orange,
            size: 30,
          ),
        ),
        SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

// Widget personalizado para títulos de sección
class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Widget personalizado para tarjetas de noticias
class NewsCard extends StatelessWidget {
  final String title;
  final String time;
  final String videoDuration;
  final String imageUrl;

  NewsCard({
    required this.title,
    required this.time,
    required this.videoDuration,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '$time • Duración: $videoDuration',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Páginas adicionales
class EmbarazoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Embarazo')),
      body: Center(child: Text('Información sobre Embarazo')),
    );
  }
}

class VistaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vista')),
      body: Center(child: Text('Información sobre Vista')),
    );
  }
}

class AudicionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Audición')),
      body: Center(child: Text('Información sobre Audición')),
    );
  }
}

class CorazonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Corazón')),
      body: Center(child: Text('Información sobre Corazón')),
    );
  }
}

class CerebroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cerebro')),
      body: Center(child: Text('Información sobre Cerebro')),
    );
  }
}

class DietaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dieta')),
      body: Center(child: Text('Información sobre Dieta')),
    );
  }

}

class EmergenciaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Emergencia')),
      body: Center(child: Text('Información sobre Emergencias')),
    );
  }
}
