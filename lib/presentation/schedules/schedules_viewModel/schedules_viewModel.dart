import 'dart:async';
import 'dart:ffi';
import 'package:rxdart/rxdart.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/usecase/schedules/schedules_create_usecase.dart';
import 'package:senior/domain/usecase/schedules/schedules_index_usecase.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/freezeClasses.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';

class SchedulesViewModel extends BaseViewModel
    with SchedulesIndexViewModelInput, SchedulesIndexViewModelOutput {
  final _schedulesIndexStreamController = BehaviorSubject<IndexSchedules>();
  final StreamController _titleStreamController = StreamController<String>.broadcast();
  final StreamController _dateStreamController = StreamController<String>.broadcast();
  final StreamController _timeStreamController = StreamController<String>.broadcast();
  final StreamController _typeStreamController = StreamController<String>.broadcast();

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
    _titleStreamController.close();
    _dateStreamController.close();
    _timeStreamController.close();
    _typeStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputSchedulesIndex => _schedulesIndexStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => areAllInputsValidStreamController.sink;

  @override
  Sink get inputDate => _dateStreamController.sink;

  @override
  Sink get inputTime => _timeStreamController.sink;

  @override
  Sink get inputTitle => _titleStreamController.sink;

  @override
  Sink get inputType => _typeStreamController.sink;

  @override
  Stream<IndexSchedules> get outputSchedulesIndex =>
      _schedulesIndexStreamController.stream.map((index) => index);

  @override
  Stream<bool> get outAreAllInputsValid =>
      areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

  @override
  Stream<bool> get outIsDateValid =>
      _dateStreamController.stream.map((date) => _isDateValid(date));

  @override
  Stream<bool> get outIsTimeValid =>
      _timeStreamController.stream.map((time) => _isTimeValid(time));

  @override
  Stream<bool> get outIsTitleValid =>
      _titleStreamController.stream.map((title) => _isTitleValid(title));

  @override
  Stream<bool> get outIsTypeValid =>
      _typeStreamController.stream.map((type) => _isTypeValid(type));


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




  bool _isDateValid(String date) {
    return date.isNotEmpty;
  }

  bool _isTimeValid(String time) {
    return time.isNotEmpty;
  }

  bool _isTitleValid(String title) {
    return title.isNotEmpty;
  }

  bool _isTypeValid(String type) {
    return type.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isTitleValid(schedulesCreateObject.title) &&
        _isDateValid(schedulesCreateObject.date) &&
        _isTimeValid(schedulesCreateObject.time) &&
        _isTypeValid(schedulesCreateObject.type);
  }

}

abstract class SchedulesIndexViewModelInput {
  Sink get inputSchedulesIndex;

  Sink get inputTitle;

  Sink get inputDate;

  Sink get inputTime;

  Sink get inputType;

  Sink get inputAreAllInputsValid;

  setTitle(String title);

  setDate(String date);

  setTime(String time);

  setType(String type);

  addTask();
}

abstract class SchedulesIndexViewModelOutput {
  Stream<IndexSchedules> get outputSchedulesIndex;

  Stream<bool> get outIsTitleValid;

  Stream<bool> get outIsDateValid;

  Stream<bool> get outIsTimeValid;

  Stream<bool> get outIsTypeValid;

  Stream<bool> get outAreAllInputsValid;
}
