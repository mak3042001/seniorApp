import 'dart:ffi';
import 'package:rxdart/subjects.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/usecase/booking/booking_index_usecase.dart';
import 'package:senior/domain/usecase/medication/medication_index_usecase.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';
import '../../common/state_renderer/state_renderer.dart';

class AppointmentViewModel extends BaseViewModel
    with AppointmentViewModelInput, AppointmentViewModelOutput {
  final _appointmentStreamController = BehaviorSubject<IndexBooking>();

  final BookingIndexUseCase bookingIndexUseCase;

  AppointmentViewModel(this.bookingIndexUseCase);

  @override
  start() async {
    _loadData();
  }

  _loadData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await bookingIndexUseCase.execute(Void)).fold(
          (failure) {
        inputState.add(ErrorState(
            StateRendererType.fullScreenErrorState, failure.message));
      },
          (appointment) async {
        inputState.add(ContentState());
        inputAppointment.add(appointment);
      },
    );
  }

  @override
  void dispose() {
    _appointmentStreamController.close();
  }

  @override
  Sink get inputAppointment => _appointmentStreamController.sink;

  //output
  @override
  Stream<IndexBooking> get outputAppointment =>
      _appointmentStreamController.stream.map((appointment) => appointment);
}

abstract class AppointmentViewModelInput {
  Sink get inputAppointment;
}

abstract class AppointmentViewModelOutput {
  Stream<IndexBooking> get outputAppointment;
}