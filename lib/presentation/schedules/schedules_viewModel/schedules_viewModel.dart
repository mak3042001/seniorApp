import 'dart:async';
import 'dart:ffi';
import 'package:rxdart/subjects.dart';
import 'package:senior/domain/model/model.dart';

import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';
import '../../../domain/usecase/schedules/schedules_cancel_usecase.dart';
import '../../../domain/usecase/schedules/schedules_create_usecase.dart';
import '../../../domain/usecase/schedules/schedules_index_usecase.dart';
import '../../common/freezeClasses.dart';
import '../../common/state_renderer/state_renderer.dart';

class SchedulesViewModel extends BaseViewModel
    with SchedulesViewModelInput, SchedulesViewModelOutput {
  final _schedulesStreamController = BehaviorSubject<IndexSchedules>();
  final StreamController _titleStreamController =
      StreamController<String>.broadcast();

  final StreamController _dateStreamController =
      StreamController<String>.broadcast();

  final StreamController _timeStreamController =
      StreamController<String>.broadcast();

  final StreamController _typeStreamController =
      StreamController<String>.broadcast();

  final StreamController _descriptionStreamController =
  StreamController<String>.broadcast();

  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  StreamController isUserSchedulesSuccessfullyStreamController =
      StreamController<bool>();

  var schedulesObject = SchedulesCreateObject("", "", "", "" , "");

  final SchedulesIndexUseCase schedulesUseCase;

  final SchedulesCreateUseCase schedulesCreateUseCase;

  final SchedulesCancelUseCase schedulesCancelUseCase;

  SchedulesViewModel(
    this.schedulesUseCase,
    this.schedulesCreateUseCase,
    this.schedulesCancelUseCase,
  );

  @override
  start() async {
    _loadData();
  }

  _loadData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await schedulesUseCase.execute(Void)).fold(
      (failure) {
        inputState.add(ErrorState(
            StateRendererType.fullScreenErrorState, failure.message));
      },
      (schedules) async {
        inputState.add(ContentState());
        inputSchedules.add(schedules);
      },
    );
  }

  @override
  void dispose() {
    _schedulesStreamController.close();
    _titleStreamController.close();
    _dateStreamController.close();
    _timeStreamController.close();
    _typeStreamController.close();
    _descriptionStreamController.close();
    _areAllInputsValidStreamController.close();
    isUserSchedulesSuccessfullyStreamController.close();
  }

  @override
  Sink get inputSchedules => _schedulesStreamController.sink;

  //output
  @override
  Stream<IndexSchedules> get outputSchedules =>
      _schedulesStreamController.stream.map((schedules) => schedules);

  @override
  create() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await schedulesCreateUseCase.execute(SchedulesCreateUseCaseInput(
      schedulesObject.title,
      schedulesObject.date,
      schedulesObject.time,
      "1",
      schedulesObject.description,
    ),))
        .fold(
            (failure) => {
                  // left -> failure
                  inputState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                }, (data) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      // navigate to main screen
      isUserSchedulesSuccessfullyStreamController.add(true);

      () {
        start();
      }.call();
    });
  }

  @override
  cancel(int id) async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await schedulesCancelUseCase.execute(SchedulesCancelUseCaseInput(id)))
        .fold(
            (failure) => {
                  // left -> failure
                  inputState.add(ErrorState(
                      StateRendererType.popupErrorState, failure.message))
                }, (data) {
      // right -> data (success)
      // content
      inputState.add(ContentState());

      () {
        start();
      }.call();
    });
  }

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  Sink get inputTitle => _titleStreamController.sink;

  @override
  Sink get inputDate => _dateStreamController.sink;

  @override
  Sink get inputTime => _timeStreamController.sink;

  @override
  Sink get inputType => _typeStreamController.sink;

  @override
  Sink get inputDescription => _descriptionStreamController.sink;

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());

  @override
  Stream<bool> get outIsTitleValid =>
      _titleStreamController.stream.map((title) => _isTitleValid(title));

  @override
  Stream<bool> get outIsDateValid =>
      _dateStreamController.stream.map((date) => _isDateValid(date));

  @override
  Stream<bool> get outIsTimeValid =>
      _timeStreamController.stream.map((time) => _isTimeValid(time));

  @override
  Stream<bool> get outIsTypeValid =>
      _typeStreamController.stream.map((type) => _isTypeValid(type));

  @override
  Stream<bool> get outIsDescriptionValid =>
      _descriptionStreamController.stream.map((description) => _isDescriptionValid(description));

  @override
  setTitle(String title) {
    inputTitle.add(title);
    schedulesObject = schedulesObject.copyWith(title: title);
    inputAreAllInputsValid.add(null);
  }

  @override
  setDate(String date) {
    inputDate.add(date);
    schedulesObject = schedulesObject.copyWith(date: date);
    inputAreAllInputsValid.add(null);
  }

  @override
  setTime(String time) {
    inputTime.add(time);
    schedulesObject = schedulesObject.copyWith(time: time);
    inputAreAllInputsValid.add(null);
  }

  @override
  setType(String type) {
    inputType.add(type);
    schedulesObject = schedulesObject.copyWith(type: type);
    inputAreAllInputsValid.add(null);
  }

  @override
  setDescription(String description) {
    inputType.add(description);
    schedulesObject = schedulesObject.copyWith(description: description);
    inputAreAllInputsValid.add(null);
  }

  bool _isTitleValid(String title) {
    return title.isNotEmpty;
  }

  bool _isDateValid(String date) {
    return date.isNotEmpty;
  }

  bool _isTimeValid(String time) {
    return time.isNotEmpty;
  }

  bool _isTypeValid(String type) {
    return type.isNotEmpty;
  }

  bool _isDescriptionValid(String description) {
    return description.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isTitleValid(schedulesObject.title) &&
        _isDateValid(schedulesObject.date) &&
        _isTimeValid(schedulesObject.time);
  }
}

abstract class SchedulesViewModelInput {
  Sink get inputSchedules;

  setTitle(String title);

  setDate(String date);

  setTime(String time);

  setType(String type);

  setDescription(String description);

  create();

  cancel(int id);

  Sink get inputTitle;

  Sink get inputDate;

  Sink get inputTime;

  Sink get inputType;

  Sink get inputDescription;

  Sink get inputAreAllInputsValid;
}

abstract class SchedulesViewModelOutput {
  Stream<IndexSchedules> get outputSchedules;

  Stream<bool> get outIsTitleValid;

  Stream<bool> get outIsDateValid;

  Stream<bool> get outIsTimeValid;

  Stream<bool> get outIsTypeValid;

  Stream<bool> get outIsDescriptionValid;

  Stream<bool> get outAreAllInputsValid;
}
