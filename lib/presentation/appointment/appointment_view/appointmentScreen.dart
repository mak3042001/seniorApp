import 'package:flutter/material.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/appointment/appointment_viewModel/appointment_viewModel.dart';
import '../../../app/di.dart';
import '../../common/state_renderer/state_renderer__impl.dart';


class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final AppointmentViewModel _viewModel = instance<AppointmentViewModel>();

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
          "Appointments",
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

  Widget _getItem(IndexBooking? notificationIndex) {
    if (notificationIndex != null) {
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
      itemCount: notificationIndex.data.length,
      );
    } else {
    return Container();
    }
  }

  Widget _matrialList(BuildContext context, int i, IndexBooking? indexBooking) {
    if (indexBooking != null) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${indexBooking.data[i]?.doctor}",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 30),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "${indexBooking.data[i]?.date}",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall,
              ),
            ],
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
