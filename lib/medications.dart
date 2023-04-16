import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:senior/static.dart';
import 'package:senior/styles/IconBroken.dart';

class MedicationsPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  final TextEditingController _frequencyController = TextEditingController();
  MedicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medications'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],

      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            'Current Medications',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: const [
                MedicationTile(
                  name: 'Lipitor',
                  dosage: '10mg',
                  frequency: 'Daily',
                ),
                MedicationTile(
                  name: 'Metformin',
                  dosage: '1000mg',
                  frequency: 'Twice daily',
                ),
                MedicationTile(
                  name: 'Aspirin',
                  dosage: '81mg',
                  frequency: 'Daily',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style:  ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue[900]!),
            ),
            child: const Text('Add Medication'),
            onPressed: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.bottomSlide,
                title: 'Edit Profile',
                body: Column(
                  children: [
                    defaultFormField(
                      controller: _nameController,
                      type: TextInputType.name,
                      text: 'Name',
                      prefix: IconBroken.Tick_Square,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    defaultFormField(
                      controller: _dosageController,
                      type: TextInputType.name,
                      text: 'Dosage',
                      prefix: IconBroken.Filter_2,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    defaultFormField(
                      controller: _frequencyController,
                      type: TextInputType.name,
                      text: 'Frequency',
                      prefix: IconBroken.Calendar,
                    ),
                  ],
                ),
                btnCancelOnPress: () {},
                btnOkOnPress: () {},
              ).show();            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class MedicationTile extends StatelessWidget {
  final String name;
  final String dosage;
  final String frequency;

  const MedicationTile({
    super.key,
    required this.name,
    required this.dosage,
    required this.frequency,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text('$dosage - $frequency' , style: const TextStyle(fontSize: 18.0),),
    );
  }
}
