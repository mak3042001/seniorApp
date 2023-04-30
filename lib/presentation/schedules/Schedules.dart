import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/static.dart';


class Schedules extends StatefulWidget {
  const Schedules({
    Key? key,
  }) : super(key: key);

  @override
  _SchedulesState createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskTimeController = TextEditingController();
  final TextEditingController _taskDataController = TextEditingController();

  final List<Map<String, dynamic>> _scheduleList = [
    {
      'title': 'Meeting with Client',
      'time': '10:00 AM - 11:00 AM',
      'date': DateTime(2022,4,30),
    },
    {
      'title': 'Design Review',
      'time': '11:30 AM - 12:30 PM',
      'date': DateTime(2023,2,1),
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


  void _incrementDate() {
    setState(() {
      _selectedDate = _selectedDate.add(const Duration(days: 1));
    });
  }

  void _decrementDate() {
    setState(() {
      _selectedDate = _selectedDate.subtract(const Duration(days: 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMd();
    final formattedDate = dateFormat.format(_selectedDate);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff3647EC), Color(0xff1E2983)]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100.0),
                    bottomRight: Radius.circular(100.0),
                  )),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              IconBroken.Arrow___Left_2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 295.0,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(
                            IconBroken.Arrow___Left_2,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          onPressed: _decrementDate,
                        ),
                        SizedBox(
                          width: 170.0,
                          child: TextFormField(
                            enableInteractiveSelection: false,
                            focusNode: AlwaysDisabledFocusNode(false),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              labelText: 'Date',
                              labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            controller: TextEditingController(
                              text: formattedDate,
                            ),
                            onTap: () async {
                              final initialDate = _selectedDate;
                              final newDate = await showDatePicker(
                                context: context,
                                initialDate: initialDate,
                                firstDate: DateTime(initialDate.year - 1),
                                lastDate: DateTime(initialDate.year + 1),
                              );
                              if (newDate != null) {
                                setState(() {
                                  _selectedDate = DateTime(
                                    newDate.year,
                                    newDate.month,
                                    newDate.day,
                                    // newTime.hour,
                                    // newTime.minute,
                                  );
                                });
                              }
                            },
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            IconBroken.Arrow___Right_2,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          onPressed: _incrementDate,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
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
                      _scheduleList[index]['date'].month !=
                          _selectedDate.month ||
                      _scheduleList[index]['date'].year != _selectedDate.year) {
                    return const SizedBox.shrink();
                  }
                  return ListTile(
                    title: Text(_scheduleList[index]['title'] , style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                    subtitle: Text(_scheduleList[index]['time'] , style: const TextStyle(fontSize: 18.0),),
                    onTap: () {
                      // navigate to schedule details page
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        onPressed: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.question,
            animType: AnimType.bottomSlide,
            title: 'Edit Profile',
            body: Column(
                    children: [
                      defaultFormField(
                        controller: _taskTitleController,
                        type: TextInputType.name,
                        text: 'Task Title',
                        prefix: IconBroken.Ticket, isPassword: false,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      defaultDisableFormField(
                        controller: _taskTimeController,
                        type: TextInputType.name,
                        text: 'Task Time',
                        prefix: IconBroken.Time_Circle,
                        enableInteractiveSelection: false,
                        hasFocusBool: false,
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: selectedTime,
                          ).then((value) {
                              _taskTimeController.text = value!.format(context);
                            },
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      defaultDisableFormField(
                        controller: _taskDataController,
                        type: TextInputType.name,
                        text: 'Task Data',
                        prefix: IconBroken.Calendar,
                        enableInteractiveSelection: false,
                        hasFocusBool: false,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: _selectedDate,
                            firstDate: _selectedDate,
                            lastDate: DateTime(_selectedDate.year + 5),
                          ).then((value) {
                            _taskDataController.text =
                                DateFormat.yMMMd().format(value!);
                          });
                        },
                      ),
                    ],
                  ),
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        },
        tooltip: 'Add Task',
        child: const Icon(IconBroken.Plus ,),
      ),
    );
  }
}
