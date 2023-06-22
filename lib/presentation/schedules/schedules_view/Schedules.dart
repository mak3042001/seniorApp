import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/static.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/resources/color_manager.dart';
import 'package:senior/presentation/resources/values_manager.dart';

import 'package:senior/presentation/schedules/schedules_viewModel/schedules_viewModel.dart';
import '../../../app/di.dart';
import '../../common/state_renderer/state_renderer__impl.dart';
import '../../resources/string_manager.dart';

class SchedulesScreen extends StatefulWidget {
  const SchedulesScreen({Key? key}) : super(key: key);

  @override
  State<SchedulesScreen> createState() => _SchedulesScreenState();
}

class _SchedulesScreenState extends State<SchedulesScreen> {
  final SchedulesViewModel _viewModel = instance<SchedulesViewModel>();

  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskTimeController = TextEditingController();
  final TextEditingController _taskDataController = TextEditingController();
  final TextEditingController _taskTypeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    bind();
    super.initState();
  }

  bind() {
    _viewModel.start();
    _taskTitleController
        .addListener(() => _viewModel.setTitle(_taskTitleController.text));
    _taskTimeController
        .addListener(() => _viewModel.setTime(_taskTimeController.text));

    _taskDataController
        .addListener(() => _viewModel.setDate(_taskDataController.text));
    _taskTypeController
        .addListener(() => _viewModel.setType(_taskTypeController.text));

    _viewModel.isUserSchedulesSuccessfullyStreamController.stream
        .listen((isLoggedIn) {
      if (isLoggedIn) {
        // navigate to main screen
        SchedulerBinding.instance.addPostFrameCallback((_) async {
          Navigator.of(context).pop();
        });
      }
    });
  }

  DateTime _selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  void _incrementDate() {
    setState(() {
      _selectedDate = _selectedDate.add(const Duration(days: 1));
      reload();
    });
  }

  void _decrementDate() {
    setState(() {
      _selectedDate = _selectedDate.subtract(const Duration(days: 1));
      reload();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy-MM-dd');
    final formattedDate = dateFormat.format(_selectedDate);
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                              fontSize: 23,
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
            Expanded(
              child: StreamBuilder<FlowState>(
                stream: _viewModel.outputState,
                builder: (context, snapshot) {
                  return SafeArea(
                    child: Container(
                      child: snapshot.data?.getScreenWidget(
                              context, _getContentWidget(formattedDate), () {
                            _viewModel.start();
                          }) ??
                          Container(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[900],
          onPressed: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.question,
              animType: AnimType.bottomSlide,
              title: 'Edit Profile',
              body: Form(
                key: _formKey,
                child: Column(
                  children: [
                    StreamBuilder<bool>(
                        stream: _viewModel.outIsTitleValid,
                        builder: (context, snapshot) {
                          return defaultFormField(
                            controller: _taskTitleController,
                            type: TextInputType.name,
                            text: 'Task Title',
                            prefix: IconBroken.Ticket,
                            isPassword: false,
                          );
                        }),
                    const SizedBox(
                      height: 10.0,
                    ),
                    StreamBuilder<bool>(
                        stream: _viewModel.outIsTimeValid,
                        builder: (context, snapshot) {
                          return defaultDisableFormField(
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
                              ).then(
                                (value) {
                                  if (value != null) {
                                    String formattedTime =
                                        "${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}";
                                    _taskTimeController.text = formattedTime;
                                  }
                                },
                              );
                            },
                          );
                        }),
                    const SizedBox(
                      height: 10.0,
                    ),
                    StreamBuilder<bool>(
                        stream: _viewModel.outIsDateValid,
                        builder: (context, snapshot) {
                          return defaultDisableFormField(
                            controller: _taskDataController,
                            type: TextInputType.name,
                            text: 'Task Data',
                            prefix: IconBroken.Calendar,
                            enableInteractiveSelection: false,
                            hasFocusBool: false,
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(_selectedDate.year + 5),
                              ).then((value) {
                                _taskDataController.text =
                                    DateFormat('yyyy-MM-dd').format(value!);
                              });
                            },
                          );
                        }),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: AppPadding.p28, right: AppPadding.p28),
                      child: StreamBuilder<bool>(
                          stream: _viewModel.outAreAllInputsValid,
                          builder: (context, snapshot) {
                            return SizedBox(
                              width: double.infinity,
                              height: AppSize.s40,
                              child: ElevatedButton(
                                  onPressed: (snapshot.data ?? false)
                                      ? () {
                                          setState(() {
                                            _taskTypeController.text = "1";
                                            _viewModel.create();
                                          });
                                        }
                                      : null,
                                  child: const Text(StringManager.ok)),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: AppSize.s28,
                    ),
                  ],
                ),
              ),
            ).show();
          },
          tooltip: 'Add Task',
          child: const Icon(
            IconBroken.Plus,
          ),
        ),
      ),
    );
  }

  Widget _getContentWidget(formattedDate) {
    return StreamBuilder<IndexSchedules>(
      stream: _viewModel.outputSchedules,
      builder: (context, snapshot) {
        return _getItem(snapshot.data , formattedDate);
      },
    );
  }

  Widget _getItem(IndexSchedules? schedules , formattedDate) {
    if (schedules != null) {
      return ListView.builder(
        itemBuilder: (context, index) => StreamBuilder<IndexSchedules>(
          stream: _viewModel.outputSchedules,
          builder: (context, snapshot) {
            return _matrialList(context, index, snapshot.data , formattedDate);
          },
        ),
        itemCount: schedules.data.length,
      );
    } else {
      return Container();
    }
  }

  Widget _matrialList(
      BuildContext context, int i, IndexSchedules? schedules , formattedDate) {
    if (schedules != null && "$formattedDate" == schedules.data[i]?.date) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 100,
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0 , right: 20.0 , top: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${schedules.data[i]?.title}",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(fontSize: 30),
                        ),
                        Text(
                          "${schedules.data[i]?.date}",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 30),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: (){
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: StringManager.cancel,
                          desc: 'are you sure about that',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            setState(() {
                              _viewModel.cancel(schedules.data[i]!.id);
                            });
                          },
                          btnOkText: "Yes",
                          btnCancelText: 'No',
                        ).show();
                      },
                      child: CircleAvatar(
                        backgroundColor: ColorManager.error,
                        child: Icon(IconBroken.Delete , color: ColorManager.white,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  reload(){
    return (){_viewModel.start();}.call();
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }
}
