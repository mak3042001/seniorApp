import 'dart:async';
import 'dart:ffi';
import 'package:rxdart/subjects.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/freezeClasses.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';
import '../../common/state_renderer/state_renderer.dart';

class HistoryViewModel extends BaseViewModel
    with HistoryViewModelInput, HistoryViewModelOutput {
  final _historyStreamController = BehaviorSubject<HistoryIndex>();
  final StreamController _titleStreamController =
  StreamController<String>.broadcast();
  final StreamController _descriptionStreamController =
  StreamController<String>.broadcast();

  final StreamController _areAllInputsValidStreamController =
  StreamController<void>.broadcast();

  StreamController isUserHistorySuccessfullyStreamController =
  StreamController<bool>();

  var historyObject = HistoryObject("", "");

  final HistoryIndexUseCase historyUseCase;

  final HistoryCreateUseCase historyCreateUseCase;

  HistoryViewModel(this.historyUseCase , this.historyCreateUseCase);

  @override
  start() async {
    _loadData();
  }

  _loadData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await historyUseCase.execute(Void)).fold(
          (failure) {
        inputState.add(ErrorState(
            StateRendererType.fullScreenErrorState, failure.message));
      },
          (history) async {
        inputState.add(ContentState());
        inputHistory.add(history);
      },
    );
  }

  @override
  void dispose() {
    _historyStreamController.close();
    _titleStreamController.close();
    _descriptionStreamController.close();
    _areAllInputsValidStreamController.close();
    isUserHistorySuccessfullyStreamController.close();
  }

  @override
  Sink get inputHistory => _historyStreamController.sink;

  //output
  @override
  Stream<HistoryIndex> get outputHistory =>
      _historyStreamController.stream.map((history) => history);

  @override
  create() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await historyCreateUseCase.execute(
    HistoryCreateUseCaseInput(historyObject.title, historyObject.description)))
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
    isUserHistorySuccessfullyStreamController.add(true);
    });
  }

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  Sink get inputDescription => _descriptionStreamController.sink;

  @override
  Sink get inputTitle => _titleStreamController.sink;

  @override
  Stream<bool> get outAreAllInputsValid => _areAllInputsValidStreamController.stream
      .map((_) => _areAllInputsValid());


  @override
  Stream<bool> get outIsDescriptionValid => _descriptionStreamController.stream
      .map((description) => _isDescriptionValid(description));

  @override
  Stream<bool> get outIsTitleValid => _titleStreamController.stream
      .map((title) => _isTitleValid(title));

  @override
  setDescription(String description) {
    inputDescription.add(description);
    historyObject = historyObject.copyWith(description: description);
    inputAreAllInputsValid.add(null);
  }

  @override
  setTitle(String title) {
    inputTitle.add(title);
    historyObject = historyObject.copyWith(title: title);
    inputAreAllInputsValid.add(null);
  }


  bool _isDescriptionValid(String description) {
    return description.isNotEmpty;
  }

  bool _isTitleValid(String title) {
    return title.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isDescriptionValid(historyObject.description) &&
        _isTitleValid(historyObject.title);
  }
}

abstract class HistoryViewModelInput {
  Sink get inputHistory;

  setTitle(String title);

  setDescription(String description);

  create();

  Sink get inputTitle;

  Sink get inputDescription;

  Sink get inputAreAllInputsValid;
}

abstract class HistoryViewModelOutput {
  Stream<HistoryIndex> get outputHistory;

  Stream<bool> get outIsTitleValid;

  Stream<bool> get outIsDescriptionValid;

  Stream<bool> get outAreAllInputsValid;
}