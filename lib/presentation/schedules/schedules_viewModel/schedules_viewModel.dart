import 'dart:async';
import 'dart:ffi';

import 'package:rxdart/rxdart.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/usecase/schedules/schedules_cancel_usecase.dart';
import 'package:senior/domain/usecase/schedules/schedules_create_usecase.dart';
import 'package:senior/domain/usecase/schedules/schedules_index_usecase.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/freezeClasses.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';

class SchedulesViewModel extends BaseViewModel
    with SchedulesIndexViewModelInput, SchedulesIndexViewModelOutput {
  final _schedulesIndexStreamController = BehaviorSubject<IndexSchedules>();
  StreamController titleStreamController = StreamController<String>.broadcast();
  StreamController dateStreamController = StreamController<String>.broadcast();
  StreamController timeStreamController = StreamController<String>.broadcast();
  StreamController typeStreamController = StreamController<String>.broadcast();

  StreamController areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  StreamController isUserScheduleCreateSuccessfullyStreamController =
      StreamController<bool>();

  var schedulesCreateObject = SchedulesCreateObject("", "", "", "");

  final SchedulesCreateUseCase schedulesCreateUseCase;
  final SchedulesIndexUseCase schedulesIndexUseCase;

  SchedulesViewModel(
    this.schedulesCreateUseCase,
    this.schedulesIndexUseCase,
  );

  @override
  void start() {
    _loadData();
    inputState.add(ContentState());
  }

  _loadData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await schedulesIndexUseCase.execute(Void)).fold(
      (failure) {
        inputState.add(ErrorState(
            StateRendererType.fullScreenErrorState, failure.message));
      },
      (schedulesIndex) async {
        inputState.add(ContentState());
        inputSchedulesIndex.add(schedulesIndex);
      },
    );
  }

  @override
  void dispose() {
    _schedulesIndexStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputSchedulesIndex => _schedulesIndexStreamController.sink;

  @override
  Stream<IndexSchedules> get outputSchedulesIndex =>
      _schedulesIndexStreamController.stream.map((index) => index);

  @override
  addTask() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await schedulesCreateUseCase.execute(SchedulesCreateUseCaseInput(
            schedulesCreateObject.title,
            schedulesCreateObject.date,
            schedulesCreateObject.time,
            schedulesCreateObject.type)))
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
      isUserScheduleCreateSuccessfullyStreamController.add(true);
    });
  }

  @override
  Sink get inputAreAllInputsValid => areAllInputsValidStreamController.sink;

  @override
  Sink get inputDate => dateStreamController.sink;

  @override
  Sink get inputTime => timeStreamController.sink;

  @override
  Sink get inputTitle => titleStreamController.sink;

  @override
  Sink get inputType => typeStreamController.sink;

  @override
  Stream<bool> get outAreAllInputsValid =>
      areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

  bool _areAllInputsValid() {
    return _isTitleValid(schedulesCreateObject.title) &&
        _isDateValid(schedulesCreateObject.date) &&
        _isTimeValid(schedulesCreateObject.time) &&
        _isTypeValid(schedulesCreateObject.type);
  }

  @override
  Stream<bool> get outIsDateValid =>
      dateStreamController.stream.map((date) => _isDateValid(date));

  bool _isDateValid(String date) {
    return date.isNotEmpty;
  }

  @override
  Stream<bool> get outIsTimeValid =>
      timeStreamController.stream.map((time) => _isTimeValid(time));

  bool _isTimeValid(String time) {
    return time.isNotEmpty;
  }

  @override
  Stream<bool> get outIsTitleValid =>
      titleStreamController.stream.map((title) => _isTitleValid(title));

  bool _isTitleValid(String title) {
    return title.isNotEmpty;
  }

  @override
  Stream<bool> get outIsTypeValid =>
      typeStreamController.stream.map((type) => _isTypeValid(type));

  bool _isTypeValid(String type) {
    return type.isNotEmpty;
  }

  @override
  setDate(String date) {
    inputDate.add(date);
    schedulesCreateObject = schedulesCreateObject.copyWith(date: date);
    inputAreAllInputsValid.add(null);
  }

  @override
  setTime(String time) {
    inputTime.add(time);
    schedulesCreateObject = schedulesCreateObject.copyWith(time: time);
    inputAreAllInputsValid.add(null);
  }

  @override
  setTitle(String title) {
    inputTitle.add(title);
    schedulesCreateObject = schedulesCreateObject.copyWith(title: title);
    inputAreAllInputsValid.add(null);
  }

  @override
  setType(String type) {
    inputType.add(type);
    schedulesCreateObject = schedulesCreateObject.copyWith(type: type);
    inputAreAllInputsValid.add(null);
  }
}

abstract class SchedulesIndexViewModelInput {
  Sink get inputSchedulesIndex;

  setTitle(String title);

  setDate(String date);

  setTime(String time);

  setType(String type);

  addTask();

  Sink get inputTitle;

  Sink get inputDate;

  Sink get inputTime;

  Sink get inputType;

  Sink get inputAreAllInputsValid;
}

abstract class SchedulesIndexViewModelOutput {
  Stream<IndexSchedules> get outputSchedulesIndex;

  Stream<bool> get outIsTitleValid;

  Stream<bool> get outIsDateValid;

  Stream<bool> get outIsTimeValid;

  Stream<bool> get outIsTypeValid;

  Stream<bool> get outAreAllInputsValid;
}
