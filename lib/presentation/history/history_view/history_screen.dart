import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/app_preference.dart';
import 'package:senior/app/static.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/history/history_viewModel/history_viewModel.dart';
import '../../../app/di.dart';
import '../../common/state_renderer/state_renderer__impl.dart';
import '../../resources/color_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/values_manager.dart';


class HistoryScreen extends StatefulWidget {
  String title;
  int id;

  HistoryScreen(this.title , this.id , {super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState(title , id);
}

class _HistoryScreenState extends State<HistoryScreen> {
  String title;
  int id;

  _HistoryScreenState(this.title , this.id);

  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskTitleUpdateController = TextEditingController();
  final TextEditingController _taskDescriptionController = TextEditingController();
  final TextEditingController _taskDescriptionUpdateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final HistoryViewModel _viewModel = instance<HistoryViewModel>();
  final AppPreference _appPreference = instance<AppPreference>();

  @override
  void initState() {
    bind();
    super.initState();
  }

  bind() {
    _viewModel.start();
    _taskTitleController
        .addListener(() => _viewModel.setTitle(_taskTitleController.text));

    _taskDescriptionController
        .addListener(() => _viewModel.setDescription(_taskDescriptionController.text));

    _taskTitleUpdateController
        .addListener(() => _viewModel.setTitleUpdate(_taskTitleUpdateController.text));

    _taskDescriptionUpdateController
        .addListener(() => _viewModel.setDescriptionUpdate(_taskDescriptionUpdateController.text));

    _viewModel.isUserHistorySuccessfullyStreamController.stream
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
        title: Text(
          title,
          style: const TextStyle(color: Colors.grey),
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
                      stream: _viewModel.outIsTitleValid,
                      builder: (context, snapshot) {
                        return defaultFormField(
                          controller: _taskTitleController,
                          type: TextInputType.name,
                          text: 'Title',
                          prefix: IconBroken.Ticket,
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
                          type: TextInputType.name,
                          text: 'Description',
                          prefix: IconBroken.Category,
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
                                      _viewModel.create(id);
                                      _taskTitleController.text = "";
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
    return StreamBuilder<HistoryIndex>(
      stream: _viewModel.outputHistory,
      builder: (context, snapshot) {
        return _getItem(snapshot.data);
      },
    );
  }

  Widget _getItem(HistoryIndex? historyIndex) {
    if (historyIndex != null) {
      return ListView.separated(
        itemBuilder: (context, index) => StreamBuilder<HistoryIndex>(
          stream: _viewModel.outputHistory,
          builder: (context, snapshot) {
            return _matrialList(context, index, snapshot.data);
          },
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey[600],
          height: 5.0,
        ),
        itemCount: historyIndex.data.length,
      );
    } else {
      return Container();
    }
  }

  Widget _matrialList(
      BuildContext context, int i, HistoryIndex? history) {
    if (history != null) {
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
                      children: [
                        Text(
                          "${history.data[i]?.title}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 30 , color: ColorManager.primary),
                        ),
                        Text(
                          "${history.data[i]?.description}",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(fontSize: 20),
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
                                  _viewModel.cancel(history.data[i]!.id);
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
                                        stream: _viewModel.outIsTitleUpdateValid,
                                        builder: (context, snapshot) {
                                          return defaultFormField(
                                            controller: _taskTitleUpdateController,
                                            type: TextInputType.name,
                                            text: 'Title',
                                            prefix: IconBroken.Ticket,
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
                                            type: TextInputType.name,
                                            text: 'Description',
                                            prefix: IconBroken.Category,
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
                                                      _viewModel.update(history.data[i]!.id);
                                                      _taskTitleUpdateController.text = "";
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
