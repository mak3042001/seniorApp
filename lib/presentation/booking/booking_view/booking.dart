import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/presentation/resources/color_manager.dart';
import 'package:senior/presentation/resources/routes_manager.dart';
import 'package:senior/presentation/resources/string_manager.dart';
import 'package:senior/presentation/resources/values_manager.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  _BookingState createState() =>
      _BookingState();
}

class _BookingState extends State<Booking> {
  late String _selectedDoctor;
  late String _selectedTimeSlot;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDoctor = _doctors.first;
    _selectedDate = DateTime.now();
    _selectedTimeSlot = _timeSlots.first;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (selectedDate != null) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }

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
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final String selectedFinishDate = dateFormat.format(_selectedDate);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconBroken.Arrow___Left_2,
            color: Colors.white,
          ),
        ),
        title: const Text('Book an Appointment'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
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
              'Select Date',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            InkWell(
              onTap: () => _selectDate(context),
              child: Row(
                children: [
                  const Icon(IconBroken.Calendar),
                  const SizedBox(width: 8.0),
                  Text(selectedFinishDate),
                ],
              ),
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
                        ? Colors.blue[900]
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
                style:  ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[900]!),
                ),
                onPressed: () {
                  // Add your logic for booking the appointment here
                },
                child: const Text(
                  'Book Appointment',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: SizedBox(
                  width: AppSize.s200,
                  height: AppSize.s40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(ColorManager.error), // Set the desired color here
                    ),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, Routes.appointmentScreen);
                    },
                    child: const Text(StringManager.appointments),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
