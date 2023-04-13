import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Scad extends StatefulWidget {
  Scad({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ScadState createState() => _ScadState();
}

class _ScadState extends State<Scad> {
  DateTime _selectedDate = DateTime.now();

  final List<Map<String, dynamic>> _scheduleList = [
    {
      'title': 'Meeting with Client',
      'time': '10:00 AM - 11:00 AM',
      'date': DateTime.now(),
    },
    {
      'title': 'Design Review',
      'time': '11:30 AM - 12:30 PM',
      'date': DateTime.now(),
    },
    {
      'title': 'Lunch Break',
      'time': '12:30 PM - 1:30 PM',
      'date': DateTime.now(),
    },
    {
      'title': 'Presentation',
      'time': '2:00 PM - 3:00 PM',
      'date': DateTime.now(),
    },
  ];

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2021),
        lastDate: DateTime(2100));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          Center(
            child: GestureDetector(
              onTap: () => _selectDate(context),
              child: Column(
                children: [
                  Text(
                    DateFormat.yMMMMd().format(_selectedDate),
                    style:
                        const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Tap to change date',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: _scheduleList.length,
              itemBuilder: (BuildContext context, int index) {
                if (_scheduleList[index]['date'].day != _selectedDate.day ||
                    _scheduleList[index]['date'].month != _selectedDate.month ||
                    _scheduleList[index]['date'].year != _selectedDate.year) {
                  return const SizedBox.shrink();
                }
                return ListTile(
                  title: Text(_scheduleList[index]['title']),
                  subtitle: Text(_scheduleList[index]['time']),
                  onTap: () {
                    // navigate to schedule details page
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // navigate to add schedule page
        },
        tooltip: 'Add Schedule',
        child: const Icon(Icons.add),
      ),
    );
  }
}
