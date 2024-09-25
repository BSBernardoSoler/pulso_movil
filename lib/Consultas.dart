import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Consultas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultas Médicas'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Calendario
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _selectedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.deepOrange,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(height: 10),
          // Tarjetas de consulta
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8),
              children: [
                ConsultaCard(
                  especialidad: 'Cardiología',
                  doctor: 'Dr. Giovanni Burgos',
                  fecha: '08/01/2022',
                  hora: '03:00 PM',
                ),
                ConsultaCard(
                  especialidad: 'Neurología',
                  doctor: 'Dra. Diana Molinares',
                  fecha: '08/01/2022',
                  hora: '03:30 PM',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ConsultaCard extends StatelessWidget {
  final String especialidad;
  final String doctor;
  final String fecha;
  final String hora;

  ConsultaCard({
    required this.especialidad,
    required this.doctor,
    required this.fecha,
    required this.hora,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  especialidad,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.person, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(doctor),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('$fecha - $hora'),
                  ],
                ),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Entrar a consulta'),
            ),
          ],
        ),
      ),
    );
  }
}
