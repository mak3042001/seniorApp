import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/app_preference.dart';
import 'package:senior/app/static.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/history_category/history_category_viewModel/history_category_viewModel.dart';
import 'package:senior/presentation/resources/routes_manager.dart';
import '../../../app/di.dart';
import '../../common/state_renderer/state_renderer__impl.dart';
import '../../resources/string_manager.dart';
import '../../resources/values_manager.dart';


class HistoryCategoriesScreen extends StatefulWidget {
  const HistoryCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<HistoryCategoriesScreen> createState() => _HistoryCategoriesScreenState();
}

class _HistoryCategoriesScreenState extends State<HistoryCategoriesScreen> {
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskDescriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final HistoryCategoriesViewModel _viewModel = instance<HistoryCategoriesViewModel>();
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

    _viewModel.isUserHistoryCategoriesSuccessfullyStreamController.stream
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
          "History Categories",
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
                  // const SizedBox(
                  //   height: 10.0,
                  // ),
                  // StreamBuilder<bool>(
                  //     stream: _viewModel.outIsTitleValid,
                  //     builder: (context, snapshot) {
                  //       return defaultFormField(
                  //         controller: _taskTypeController,
                  //         type: TextInputType.name,
                  //         text: 'Task Type',
                  //         prefix: IconBroken.Category,
                  //         isPassword: false,
                  //       );
                  //     }),
                  const SizedBox(
                    height: 10.0,
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
                                    _viewModel.create();
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
    return StreamBuilder<HistoryCategoriesIndex>(
      stream: _viewModel.outputHistoryCategories,
      builder: (context, snapshot) {
        return _getItem(snapshot.data);
      },
    );
  }

  Widget _getItem(HistoryCategoriesIndex? historyCategoriesIndex) {
    if (historyCategoriesIndex != null) {
      return ListView.separated(
        itemBuilder: (context, index) => StreamBuilder<HistoryCategoriesIndex>(
          stream: _viewModel.outputHistoryCategories,
          builder: (context, snapshot) {
            return _matrialList(context, index, snapshot.data);
          },
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey[600],
          height: 5.0,
        ),
        itemCount: historyCategoriesIndex.data.length,
      );
    } else {
      return Container();
    }
  }

  Widget _matrialList(
      BuildContext context, int i, HistoryCategoriesIndex? history) {
    if (history != null) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 70,
          child: InkWell(
            onTap: (){
              _appPreference.setHistoryCategoryId(history.data[i]?.id);
              Navigator.pushNamed(context, Routes.history);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${history.data[i]?.title}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: 30),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${history.data[i]?.description}",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }
}
