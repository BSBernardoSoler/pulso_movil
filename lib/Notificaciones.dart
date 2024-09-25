import 'package:flutter/material.dart';

class Notificaciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notificaciones'),
          backgroundColor: Colors.deepPurple,
        ),
        body: NotificacionesScreen(),
      ),
    );
  }
}

class NotificacionesScreen extends StatelessWidget {
  final List<Map<String, String>> notificaciones = [
    {
      'estado': 'Consulta cancelada',
      'especialidad': 'Cardiología',
      'fecha': '08/01/2022',
      'tiempo': 'Hace 2 minutos',
      'color': '0xFFFFF3E0',
      'borde': '0xFFFFAB91'
    },
    {
      'estado': 'Confirmación de consulta',
      'especialidad': 'Cardiología',
      'fecha': '08/01/2022',
      'tiempo': 'Ayer',
      'color': '0xFFFFF3E0',
      'borde': '0xFFFFAB91'
    },
    {
      'estado': 'Confirmación de consulta',
      'especialidad': 'Neurología',
      'fecha': '07/25/2021',
      'tiempo': '',
      'color': '0xFFEDE7F6',
      'borde': '0xFFB39DDB'
    },
    {
      'estado': 'Confirmación de consulta',
      'especialidad': 'General',
      'fecha': '06/20/2021',
      'tiempo': '',
      'color': '0xFFEDE7F6',
      'borde': '0xFFB39DDB'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: "General (8)"),
              Tab(text: "Consultas (2)"),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.deepPurple,
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(child: Text('General Tab Content')),
                ListView.builder(
                  itemCount: notificaciones.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NotificationCard(
                        estado: notificaciones[index]['estado']!,
                        especialidad: notificaciones[index]['especialidad']!,
                        fecha: notificaciones[index]['fecha']!,
                        tiempo: notificaciones[index]['tiempo']!,
                        color: Color(int.parse(notificaciones[index]['color']!)),
                        borde: Color(int.parse(notificaciones[index]['borde']!)),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String estado;
  final String especialidad;
  final String fecha;
  final String tiempo;
  final Color color;
  final Color borde;

  const NotificationCard({
    required this.estado,
    required this.especialidad,
    required this.fecha,
    required this.tiempo,
    required this.color,
    required this.borde,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: borde, width: 1.5),
      ),
      child: ListTile(
        title: Text(
          estado,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(especialidad + ' - ' + fecha),
            if (tiempo.isNotEmpty) Text(tiempo, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
