import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/app_preference.dart';
import 'package:senior/app/di.dart';
import 'package:senior/app/static.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/medications/medication_viewModel/medication_viewModel.dart';
import 'package:senior/presentation/resources/color_manager.dart';
import 'package:senior/presentation/resources/string_manager.dart';

import '../../common/state_renderer/state_renderer__impl.dart';
import '../../resources/values_manager.dart';

class Medications extends StatefulWidget {

  const Medications({super.key});

  @override
  State<Medications> createState() => _MedicationsState();
}

class _MedicationsState extends State<Medications> {
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskNameUpdateController = TextEditingController();
  final TextEditingController _taskDoseController = TextEditingController();
  final TextEditingController _taskDescriptionController = TextEditingController();
  final TextEditingController _taskDoseUpdateController = TextEditingController();
  final TextEditingController _taskDescriptionUpdateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final MedicationsViewModel _viewModel = instance<MedicationsViewModel>();

  @override
  void initState() {
    bind();
    super.initState();
  }

  bind() {
    _viewModel.start();
    _taskNameController
        .addListener(() => _viewModel.setName(_taskNameController.text));

    _taskDoseController
        .addListener(() => _viewModel.setDose(_taskDoseController.text));

    _taskDescriptionController
        .addListener(() => _viewModel.setDescription(_taskDescriptionController.text));

    _taskNameUpdateController
        .addListener(() => _viewModel.setNameUpdate(_taskNameUpdateController.text));

    _taskDoseUpdateController
        .addListener(() => _viewModel.setDoseUpdate(_taskDoseUpdateController.text));

    _taskDescriptionUpdateController
        .addListener(() => _viewModel.setDescriptionUpdate(_taskDescriptionUpdateController.text));

    _viewModel.isUserMedicationsSuccessfullyStreamController.stream
        .listen((isCreate) {
      if (isCreate) {
        // navigate to main screen
        SchedulerBinding.instance.addPostFrameCallback((_) async {
          Navigator.of(context).pop();
        });
      }
    });  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff283DAA),
        title: const Text(
          StringManager.medications,
          style: TextStyle(color: Colors.grey),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconBroken.Arrow___Left_2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
                  (){_viewModel.start();}.call();
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return Container(
            child:
            snapshot.data?.getScreenWidget(context, _getContentWidget(), () {
              _viewModel.start();
            }) ??
                Container(),
          );
        },
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
                      stream: _viewModel.outIsNameValid,
                      builder: (context, snapshot) {
                        return defaultFormField(
                          controller: _taskNameController,
                          type: TextInputType.name,
                          text: 'Name',
                          prefix: IconBroken.Ticket,
                          isPassword: false,
                        );
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  StreamBuilder<bool>(
                      stream: _viewModel.outIsDoseValid,
                      builder: (context, snapshot) {
                        return defaultFormField(
                          controller: _taskDoseController,
                          type: TextInputType.number,
                          text: 'Dose',
                          prefix: IconBroken.Category,
                          isPassword: false,
                        );
                      }),

                  const SizedBox(
                    height: 20.0,
                  ),
                  StreamBuilder<bool>(
                      stream: _viewModel.outIsDescriptionValid,
                      builder: (context, snapshot) {
                        return defaultFormField(
                          controller: _taskDescriptionController,
                          type: TextInputType.text,
                          text: 'Description',
                          prefix: IconBroken.Document,
                          isPassword: false,
                        );
                      }),
                  const SizedBox(
                    height: 20.0,
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
                                    _viewModel.create();
                                    _taskNameController.text = "";
                                    _taskDoseController.text = "";
                                    _taskDescriptionController.text = "";
                                  });
                                }
                                    : null,
                                child: const Text(StringManager.create)),
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
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<MedicationsIndex>(
      stream: _viewModel.outputMedications,
      builder: (context, snapshot) {
        return _getItem(snapshot.data);
      },
    );
  }

  Widget _getItem(MedicationsIndex? medicationsIndex) {
    if (medicationsIndex != null) {
      return ListView.separated(
        itemBuilder: (context, index) => StreamBuilder<MedicationsIndex>(
          stream: _viewModel.outputMedications,
          builder: (context, snapshot) {
            return _matrialList(context, index, snapshot.data);
          },
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey[600],
          height: 5.0,
        ),
        itemCount: medicationsIndex.data.length,
      );
    } else {
      return Container();
    }
  }

  Widget _matrialList(
      BuildContext context, int i, MedicationsIndex? medications) {
    if (medications != null) {
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
                          "${medications.data[i]?.medication}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 30 , color: ColorManager.primary),
                        ),
                        Row(
                          children: [
                            Text(
                              "${medications.data[i]?.medicationDose}",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(fontSize: 20),
                            ),
                            Text(
                              StringManager.dose,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(fontSize: 20),
                            ),
                          ],
                        ),
                        Text(
                          "${medications.data[i]?.description}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 20 , color: ColorManager.primary),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
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
                                  _viewModel.cancel(medications.data[i]!.id);
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
                        const SizedBox(
                          height: 5.0,
                        ),
                        InkWell(
                          onTap: (){
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
                                        stream: _viewModel.outIsNameUpdateValid,
                                        builder: (context, snapshot) {
                                          return defaultFormField(
                                            controller: _taskNameUpdateController,
                                            type: TextInputType.name,
                                            text: 'Name',
                                            prefix: IconBroken.Ticket,
                                            isPassword: false,
                                          );
                                        }),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    StreamBuilder<bool>(
                                        stream: _viewModel.outIsDoseUpdateValid,
                                        builder: (context, snapshot) {
                                          return defaultFormField(
                                            controller: _taskDoseUpdateController,
                                            type: TextInputType.number,
                                            text: 'Dose',
                                            prefix: IconBroken.Category,
                                            isPassword: false,
                                          );
                                        }),

                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    StreamBuilder<bool>(
                                        stream: _viewModel.outIsDescriptionUpdateValid,
                                        builder: (context, snapshot) {
                                          return defaultFormField(
                                            controller: _taskDescriptionUpdateController,
                                            type: TextInputType.text,
                                            text: 'Description',
                                            prefix: IconBroken.Document,
                                            isPassword: false,
                                          );
                                        }),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: AppPadding.p28, right: AppPadding.p28),
                                      child: StreamBuilder<bool>(
                                          stream: _viewModel.outAreAllInputsUpdateValid,
                                          builder: (context, snapshot) {
                                            return SizedBox(
                                              width: double.infinity,
                                              height: AppSize.s40,
                                              child: ElevatedButton(
                                                  onPressed: (snapshot.data ?? false)
                                                      ? () {
                                                    setState(() {
                                                      _viewModel.update(medications.data[i]!.id);
                                                      _taskNameUpdateController.text = "";
                                                      _taskDoseUpdateController.text = "";
                                                      _taskDescriptionUpdateController.text = "";
                                                    });
                                                  }
                                                      : null,
                                                  child: const Text(StringManager.edit)),
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
                          child: CircleAvatar(
                            backgroundColor: ColorManager.white,
                            child: Icon(IconBroken.Edit_Square , color: ColorManager.black,),
                          ),
                        ),
                      ],
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
