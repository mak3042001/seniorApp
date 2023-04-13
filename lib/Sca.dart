import 'package:flutter/material.dart';

class Scad extends StatefulWidget {
  const Scad({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ScadState createState() => _ScadState();
}

class _ScadState extends State<Scad> {
  final List<String> _scheduleTitles = [    'Meeting with Client',    'Design Review',    'Lunch Break',    'Presentation'  ];

  final List<String> _scheduleTimes = [    '10:00 AM - 11:00 AM',    '11:30 AM - 12:30 PM',    '12:30 PM - 1:30 PM',    '2:00 PM - 3:00 PM'  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _scheduleTitles.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(_scheduleTitles[index]),
              subtitle: Text(_scheduleTimes[index]),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                // navigate to schedule details page
              },
            ),
          );
        },
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