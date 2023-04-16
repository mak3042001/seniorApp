import 'package:flutter/material.dart';

class AppointmentBookingScreen extends StatefulWidget {
  const AppointmentBookingScreen({Key? key}) : super(key: key);

  @override
  _AppointmentBookingScreenState createState() =>
      _AppointmentBookingScreenState();
}

class _AppointmentBookingScreenState extends State<AppointmentBookingScreen> {
  late String _selectedDoctor;
  late String _selectedTimeSlot;

  final List<String> _doctors = [
    'Dr. John Doe',
    'Dr. Jane Smith',
    'Dr. Alex Johnson',
  ];

  final List<String> _timeSlots = [
    '9:00 AM - 9:30 AM',
    '9:30 AM - 10:00 AM',
    '10:00 AM - 10:30 AM',
    '10:30 AM - 11:00 AM',
    '11:00 AM - 11:30 AM',
    '11:30 AM - 12:00 PM',
    '1:00 PM - 1:30 PM',
    '1:30 PM - 2:00 PM',
    '2:00 PM - 2:30 PM',
    '2:30 PM - 3:00 PM',
    '3:00 PM - 3:30 PM',
    '3:30 PM - 4:00 PM',
  ];

  @override
  void initState() {
    super.initState();
    _selectedDoctor = _doctors.first;
    _selectedTimeSlot = _timeSlots.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book an Appointment'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Doctor',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            DropdownButton<String>(
              value: _selectedDoctor,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDoctor = newValue!;
                });
              },
              items: _doctors.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 32.0),
            const Text(
              'Select Time Slot',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 2.0,
              children: _timeSlots.map((String timeSlot) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedTimeSlot = timeSlot;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedTimeSlot == timeSlot
                        ? Colors.blue
                        : Colors.grey[300],
                  ),
                  child: Text(
                    timeSlot,
                    textAlign: TextAlign.center,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add your logic for booking the appointment here
                },
                child: const Text('Book Appointment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
