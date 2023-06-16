import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/app_preference.dart';
import 'package:senior/app/static.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/appointment/appointment_viewModel/appointment_viewModel.dart';
import 'package:senior/presentation/history/history_view/history_screen.dart';
import '../../../app/di.dart';
import '../../common/state_renderer/state_renderer__impl.dart';
import '../../resources/color_manager.dart';
import '../../resources/string_manager.dart';
import '../../resources/values_manager.dart';


class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final AppointmentViewModel _viewModel = instance<AppointmentViewModel>();
  final AppPreference _appPreference = instance<AppPreference>();

  @override
  void initState() {
    bind();
    super.initState();
  }

  bind() {
    _viewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff283DAA),
        title: const Text(
          StringManager.appointments,
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
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<IndexBooking>(
      stream: _viewModel.outputAppointment,
      builder: (context, snapshot) {
        return _getItem(snapshot.data);
      },
    );
  }

  Widget _getItem(IndexBooking? indexBooking) {
    if (indexBooking != null) {
      return ListView.separated(
        itemBuilder: (context, index) => StreamBuilder<IndexBooking>(
          stream: _viewModel.outputAppointment,
          builder: (context, snapshot) {
            return _matrialList(context, index, snapshot.data);
          },
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey[600],
          height: 5.0,
        ),
        itemCount: indexBooking.data.length,
      );
    } else {
      return Container();
    }
  }

  Widget _matrialList(
      BuildContext context, int i, IndexBooking? booking) {
    if (booking != null) {
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
                          "${booking.data[i]?.doctor?.name}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 30 , color: ColorManager.primary),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "${booking.data[i]?.date}",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 20),
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
                              _viewModel.cancel(booking.data[i]!.id);
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

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }
}
