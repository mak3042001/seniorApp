import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/app_preference.dart';
import 'package:senior/app/di.dart';
import 'package:senior/app/static.dart';
import 'package:senior/presentation/booking/booking_viewModel/booking_view_model.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';
import 'package:senior/presentation/login/login_view_model/login_viewModel.dart';
import 'package:senior/presentation/resources/assets_manager.dart';
import 'package:senior/presentation/resources/color_manager.dart';
import 'package:senior/presentation/resources/routes_manager.dart';
import 'package:senior/presentation/resources/string_manager.dart';
import 'package:senior/presentation/resources/values_manager.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final BookingModel _viewModel = instance<BookingModel>();

  final TextEditingController _doctorController = TextEditingController();

  final TextEditingController _dateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  _blind() {
    _viewModel.start();
    _doctorController
        .addListener(() => _viewModel.setDoctor(_doctorController.text));
    _dateController
        .addListener(() => _viewModel.setDate(_dateController.text));

    _viewModel.isUserBookingSuccessfullyStreamController.stream
        .listen((isBooking) {
      if (isBooking) {
        // navigate to main screen
        SchedulerBinding.instance.addPostFrameCallback((_) async {
        });
      }
    });
  }

  @override
  void initState() {
    _blind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff283DAA),
        title: const Text(
          "Booking Appointment",
          style: TextStyle(color: Colors.white),
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
      backgroundColor: ColorManager.white,
      body: StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data
              ?.getScreenWidget(context, _getContentWidget(), () {}) ??
              _getContentWidget();
        },
      ),
    );
  }

  Widget _getContentWidget() {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p40),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool>(
                    stream: _viewModel.outIsDoctorValid,
                    builder: (context, snapshot) {
                      return defaultFormField(
                          controller: _doctorController,
                          isPassword: false,
                          type: TextInputType.number,
                          text: StringManager.doctorId,
                          prefix: IconBroken.User,
                          errorText: (snapshot.data ?? true)
                              ? null
                              : StringManager.doctorError);
                    }),
              ),
              const SizedBox(
                height: AppSize.s28,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: StreamBuilder<bool?>(
                    stream: _viewModel.outIsDateValid,
                    builder: (context, snapshot) {
                      return defaultDisableFormField(
                        enableInteractiveSelection: false,
                        hasFocusBool: false,
                        errorText: (snapshot.data ?? true)
                            ? null
                            : StringManager.dateError,
                        controller: _dateController,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          ).then((value) {
                            _dateController.text =
                                DateFormat('yyyy-MM-dd').format(value!);
                          });
                        },
                        type: TextInputType.none,
                        text: _dateController.text != null
                            ? 'date'
                            : _dateController.text,
                        prefix: IconBroken.Calendar,
                      );
                    }),
              ),
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
                              _viewModel.booking();
                              _dateController.text = "";
                              _doctorController.text = "";
                            }
                                : null,
                            child: const Text(StringManager.booking)),
                      );
                    }),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppPadding.p28, right: AppPadding.p28),
                child: SizedBox(
                  width: AppSize.s200,
                  height: AppSize.s40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(ColorManager.error), // Set the desired color here
                    ),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, Routes.appointmentScreen);
                    },
                    child: const Text(StringManager.appointments),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }
}
