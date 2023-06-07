
import 'dart:async';

import 'package:senior/domain/usecase/auth/login_usecase.dart';
import 'package:senior/domain/usecase/booking/booking_create_usecase.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/freezeClasses.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';

class BookingViewModel extends BaseViewModel
    with BookingViewModelInputs, BookingViewModelOutputs {
  final StreamController _doctorStreamController =
  StreamController<String>.broadcast();
  final StreamController _dateStreamController =
  StreamController<String>.broadcast();

  final StreamController _areAllInputsValidStreamController =
  StreamController<void>.broadcast();

  StreamController isUserLoggedInSuccessfullyStreamController =
  StreamController<bool>();

  var bookingObject = BookingCreateObject("", "");
  final BookingCreateUseCase _bookingCreateUseCase;

  BookingViewModel(this._bookingCreateUseCase);

  // inputs
  @override
  void dispose() {
    super.dispose();
    _doctorStreamController.close();
    _dateStreamController.close();
    _areAllInputsValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
  }

  @override
  void start() {
    // view model should tell view please show content state
    inputState.add(ContentState());
  }

  @override
  Sink get inputDate => _dateStreamController.sink;

  @override
  Sink get inputDoctor => _doctorStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  setDate(String date) {
    inputDate.add(date);
    bookingObject = bookingObject.copyWith(date: date);
    inputAreAllInputsValid.add(null);
  }

  @override
  setDoctor(String doctor) {
    inputDoctor.add(doctor);
    bookingObject = bookingObject.copyWith(doctorId: doctor);
    inputAreAllInputsValid.add(null);
  }

  @override
  booking() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.fullScreenLoadingState));
    (await _bookingCreateUseCase.execute(
        BookingCreateUseCaseInput(bookingObject.doctorId, bookingObject.date)))
        .fold(
            (failure) => {
          // left -> failure
          inputState.add(ErrorState(
              StateRendererType.fullScreenErrorState, failure.message))
        }, (data) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      // navigate to main screen
      isUserLoggedInSuccessfullyStreamController.add(true);
    });
  }

  // outputs
  @override
  Stream<bool> get outIsDateValid => _dateStreamController.stream
      .map((date) => _isDateValid(date));

  @override
  Stream<bool> get outIsDoctorValid => _doctorStreamController.stream
      .map((doctor) => _isDoctorValid(doctor));

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  bool _isDateValid(String date) {
    return date.isNotEmpty;
  }

  bool _isDoctorValid(String doctor) {
    return doctor.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isDateValid(bookingObject.date) &&
        _isDoctorValid(bookingObject.doctorId);
  }
}

abstract class BookingViewModelInputs {
  setDoctor(String doctor);

  setDate(String date);

  booking();

  Sink get inputDoctor;

  Sink get inputDate;

  Sink get inputAreAllInputsValid;
}

abstract class BookingViewModelOutputs {
  Stream<bool> get outIsDoctorValid;

  Stream<bool> get outIsDateValid;

  Stream<bool> get outAreAllInputsValid;
}