import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/app_preference.dart';
import 'package:senior/app/di.dart';
import 'package:senior/app/static.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';
import 'package:senior/presentation/schedules/schedules_viewModel/schedules_viewModel.dart';


class Schedules extends StatefulWidget {
  const Schedules({
    Key? key,
  }) : super(key: key);

  @override
  _SchedulesState createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  final SchedulesViewModel _viewModel = instance<SchedulesViewModel>();
  final AppPreference _appPreference = instance<AppPreference>();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskTimeController = TextEditingController();
  final TextEditingController _taskDataController = TextEditingController();
  final TextEditingController _taskTypeController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  _blind() {
    _viewModel.start();
    _taskTitleController
        .addListener(() => _viewModel.setTitle(_taskTitleController.text));

    _taskDataController
        .addListener(() => _viewModel.setDate(_taskDataController.text));

    _taskTimeController
        .addListener(() => _viewModel.setTitle(_taskTimeController.text));

    _taskTypeController
        .addListener(() => _viewModel.setTitle(_taskTypeController.text));

    _viewModel.isUserScheduleCreateSuccessfullyStreamController.stream
        .listen((isSchedulesCreate) {
      if (isSchedulesCreate) {
        // navigate to main screen
        SchedulerBinding.instance.addPostFrameCallback((_) async {
          _appPreference.setUserLoggedIn();
          Navigator.of(context).pop();
        });
      }
    });
  }

  @override
  void initState() {
    _blind();
    super.initState();
  }

  // final List<Map<String, dynamic>> scheduleList = [
  //   {
  //     'title': 'Meeting with Client',
  //     'time': '10:00 AM - 11:00 AM',
  //     'date': DateTime(2022,4,30),
  //   },
  //   {
  //     'title': 'Design Review',
  //     'time': '11:30 AM - 12:30 PM',
  //     'date': DateTime(2023,2,1),
  //   },
  //   {
  //     'title': 'Lunch Break',
  //     'time': '12:30 PM - 1:30 PM',
  //     'date': DateTime.now(),
  //   },
  //   {
  //     'title': 'Presentation',
  //     'time': '2:00 PM - 3:00 PM',
  //     'date': DateTime.now(),
  //   },
  // ];


  void incrementDate() {
    setState(() {
      selectedDate = selectedDate.add(const Duration(days: 1));
    });
  }

  void decrementDate() {
    setState(() {
      selectedDate = selectedDate.subtract(const Duration(days: 1));
    });
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data
              ?.getScreenWidget(context, _getContentWidget(snapshot.data), () {}) ??
              Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        onPressed: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.question,
            animType: AnimType.bottomSlide,
            title: 'create task',
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
                            initialDate: selectedDate,
                            firstDate: selectedDate,
                            lastDate: DateTime(selectedDate.year + 5),
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

  Widget _getContentWidget(var snapshot ,) {

    final dateFormat = DateFormat('yyyy-MM-dd');
    final formattedDate = dateFormat.format(selectedDate);

    return SafeArea(
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
                        onPressed: decrementDate,
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
                            final initialDate = selectedDate;
                            final newDate = await showDatePicker(
                              context: context,
                              initialDate: initialDate,
                              firstDate: DateTime(initialDate.year - 1),
                              lastDate: DateTime(initialDate.year + 1),
                            );
                            if (newDate != null) {
                              setState(() {
                                selectedDate = DateTime(
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
                        onPressed: incrementDate,
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

            child: StreamBuilder<IndexSchedules>(
          stream: _viewModel.outputSchedulesIndex,
              builder: (context, snapshot) {
                return _getItem(snapshot.data);
              },
          ),
          )],
      ),
    );
  }

  Widget _getItem(IndexSchedules? snapshot){
    return ListView.builder(
      itemCount: snapshot?.data.length,
      itemBuilder: (BuildContext context, int index) {
        if (snapshot!.data[index]!.date.day != selectedDate.day ||
            snapshot.data[index]!.date.month!=
                selectedDate.month ||
            snapshot.data[index]!.date.year != selectedDate.year) {
          return const SizedBox.shrink();
        }
        return ListTile(
          title: Text(snapshot.data[index]!.title , style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),),
          subtitle: Text(snapshot.data[index]!.time , style: const TextStyle(fontSize: 18.0),),
          onTap: () {
            // navigate to schedule details page
          },
        );
      },
    );
  }

  Widget _getFloatingActionButtonWidget(var snapshot ,) {
    return FloatingActionButton(
      backgroundColor: Colors.blue[900],
      onPressed: () {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.question,
          animType: AnimType.bottomSlide,
          title: 'create task',
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
                    initialDate: selectedDate,
                    firstDate: selectedDate,
                    lastDate: DateTime(selectedDate.year + 5),
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
    );
  }
}

