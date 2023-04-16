import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:senior/static.dart';
import 'package:senior/styles/IconBroken.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final DateTime _selectedDate = DateTime.now();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  final List<MedicalCondition> conditions = [
    MedicalCondition(
      name: 'Hypertension',
      date: '01/01/2022',
      notes: 'Prescribed medication: Lisinopril',
    ),
    MedicalCondition(
      name: 'Asthma',
      date: '05/01/2021',
      notes: 'Prescribed medication: Albuterol inhaler',
    ),
    MedicalCondition(
      name: 'Diabetes',
      date: '08/01/2020',
      notes: 'Prescribed medication: Metformin',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
        title: const Text('Medical History'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Patient Name',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Patient ID',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Medical Conditions',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: conditions.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Card(
                      elevation: 2.0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              conditions[index].name,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              'Diagnosed on ${conditions[index].date}',
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              conditions[index].notes,
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.question,
            animType: AnimType.bottomSlide,
            title: 'Edit Profile',
            body: Column(
              children: [
                defaultFormField(
                  controller: nameController,
                  type: TextInputType.name,
                  text: 'Name',
                  prefix: IconBroken.Ticket,
                  isPassword: false,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                defaultDisableFormField(
                  controller: dateController,
                  type: TextInputType.name,
                  text: 'Data',
                  prefix: IconBroken.Calendar,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(_selectedDate.year - 5),
                      lastDate: DateTime(_selectedDate.year + 5),
                    ).then((value) {
                      dateController.text = DateFormat.yMMMd().format(value!);
                    });
                  },
                  enableInteractiveSelection: false,
                  hasFocusBool: false,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                defaultFormField(
                  controller: noteController,
                  type: TextInputType.name,
                  text: 'Note',
                  prefix: IconBroken.Ticket,
                  isPassword: false,
                ),
              ],
            ),
            btnCancelOnPress: () {},
            btnOkOnPress: () {
              setState(() {
                conditions.add(MedicalCondition(
                  name: nameController.text,
                  date: dateController.text,
                  notes: noteController.text,
                ));
              });
            },
          ).show();
        },
        backgroundColor: Colors.blue[900],
        child: const Icon(IconBroken.Plus),
      ),
    );
  }
}

class MedicalCondition {
  final String name;
  final String date;
  final String notes;

  MedicalCondition(
      {required this.name, required this.date, required this.notes});
}
