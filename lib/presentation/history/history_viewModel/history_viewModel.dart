import 'dart:async';
import 'dart:ffi';
import 'package:rxdart/subjects.dart';

import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/usecase/history/history_cancel_usecase.dart';
import 'package:senior/domain/usecase/history/history_create_usecase.dart';
import 'package:senior/domain/usecase/history/history_index_usecase.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/freezeClasses.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';
import '../../../domain/usecase/history/history_update_usecase.dart';
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

  final StreamController _titleUpdateStreamController =
  StreamController<String>.broadcast();

  final StreamController _descriptionUpdateStreamController =
  StreamController<String>.broadcast();

  final StreamController _areAllInputsUpdateValidStreamController =
  StreamController<void>.broadcast();

  StreamController isUserHistorySuccessfullyStreamController =
  StreamController<bool>();

  var historyObject = HistoryObject("", "");

  var historyUpdateObject = HistoryUpdateObject("", "");

  final HistoryIndexUseCase historyUseCase;

  final HistoryCreateUseCase historyCreateUseCase;

  final HistoryCancelUseCase historyCancelUseCase;

  final HistoryUpdateUseCase historyUpdateUseCase;


  HistoryViewModel(this.historyUseCase , this.historyCreateUseCase , this.historyCancelUseCase , this.historyUpdateUseCase);

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
    _titleUpdateStreamController.close();
    _areAllInputsValidStreamController.close();
    _areAllInputsUpdateValidStreamController.close();
    isUserHistorySuccessfullyStreamController.close();
  }

  @override
  Sink get inputHistory => _historyStreamController.sink;

  //output
  @override
  Stream<HistoryIndex> get outputHistory =>
      _historyStreamController.stream.map((history) => history);

  @override
  create(int id) async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await historyCreateUseCase.execute(
    HistoryCreateUseCaseInput(id,historyObject.title, historyObject.description)))
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

        (){
      start();
    }.call();
    });
  }

  @override
  cancel(int id) async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await historyCancelUseCase.execute(HistoryCancelUseCaseInput(id)))
        .fold(
    (failure) => {
    // left -> failure
    inputState.add(ErrorState(
    StateRendererType.popupErrorState, failure.message))
    }, (data) {
    // right -> data (success)
    // content
    inputState.add(ContentState());

    (){
      start();
    }.call();
    });
  }

  @override
  update(id) async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await historyUpdateUseCase.execute(
        HistoryUpdateUseCaseInput(id, historyUpdateObject.title, historyUpdateObject.description)))
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

          (){
        start();
      }.call();
    });
  }

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  Sink get inputAreAllInputsUpdateValid => _areAllInputsUpdateValidStreamController.sink;

  @override
  Sink get inputTitle => _titleStreamController.sink;

  @override
  Sink get inputTitleUpdate => _titleUpdateStreamController.sink;

  @override
  Stream<bool> get outAreAllInputsValid => _areAllInputsValidStreamController.stream
      .map((_) => _areAllInputsValid());

  @override
  Stream<bool> get outAreAllInputsUpdateValid => _areAllInputsUpdateValidStreamController.stream
      .map((_) => _areAllInputsUpdateValid());

  @override
  Stream<bool> get outIsTitleValid => _titleStreamController.stream
      .map((title) => _isTitleValid(title));

  @override
  Stream<bool> get outIsTitleUpdateValid => _titleUpdateStreamController.stream
      .map((title) => _isTitleUpdateValid(title));

  @override
  setTitle(String title) {
    inputTitle.add(title);
    historyObject = historyObject.copyWith(title: title);
    inputAreAllInputsValid.add(null);
  }

  @override
  setTitleUpdate(String title) {
    inputTitleUpdate.add(title);
    historyUpdateObject = historyUpdateObject.copyWith(title: title);
    inputAreAllInputsUpdateValid.add(null);
  }



  bool _isTitleValid(String title) {
    return title.isNotEmpty;
  }

  bool _isDescriptionValid(String description) {
    return description.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isTitleValid(historyObject.title) && _isDescriptionValid(historyObject.description);
  }

  bool _isTitleUpdateValid(String title) {
    return title.isNotEmpty;
  }
  bool _isDescriptionUpdateValid(String description) {
    return description.isNotEmpty;
  }

  bool _areAllInputsUpdateValid() {
    return _isTitleUpdateValid(historyUpdateObject.title) && _isDescriptionUpdateValid(historyUpdateObject.description);
  }

  @override
  Sink get inputDescription => _descriptionStreamController.sink;

  @override
  Sink get inputDescriptionUpdate => _descriptionUpdateStreamController.sink;

  @override
  Stream<bool> get outIsDescriptionUpdateValid => _descriptionUpdateStreamController.stream
      .map((description) => _isDescriptionUpdateValid(description));

  @override
  Stream<bool> get outIsDescriptionValid => _descriptionStreamController.stream
      .map((description) => _isDescriptionValid(description));

  @override
  setDescription(String description) {
    inputDescription.add(description);
    historyObject = historyObject.copyWith(description: description);
    inputAreAllInputsValid.add(null);
  }

  @override
  setDescriptionUpdate(String description) {
    inputDescriptionUpdate.add(description);
    historyUpdateObject = historyUpdateObject.copyWith(description: description);
    inputAreAllInputsUpdateValid.add(null);
  }
}

abstract class HistoryViewModelInput {
  Sink get inputHistory;

  setTitle(String title);
  setDescription(String description);

  create(int id);

  cancel(int id);

  setTitleUpdate(String title);
  setDescriptionUpdate(String description);

  update(int id);

  Sink get inputTitle;
  Sink get inputDescription;

  Sink get inputTitleUpdate;
  Sink get inputDescriptionUpdate;

  Sink get inputAreAllInputsValid;

  Sink get inputAreAllInputsUpdateValid;
}

abstract class HistoryViewModelOutput {
  Stream<HistoryIndex> get outputHistory;

  Stream<bool> get outIsTitleValid;
  Stream<bool> get outIsDescriptionValid;

  Stream<bool> get outAreAllInputsValid;

  Stream<bool> get outIsTitleUpdateValid;
  Stream<bool> get outIsDescriptionUpdateValid;

  Stream<bool> get outAreAllInputsUpdateValid;
}