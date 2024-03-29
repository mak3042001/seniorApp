import 'dart:async';
import 'dart:ffi';
import 'package:rxdart/subjects.dart';

import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/usecase/history_categories/historyCategories_cancel_usecase.dart';
import 'package:senior/domain/usecase/history_categories/historyCategories_create_usecase.dart';
import 'package:senior/domain/usecase/history_categories/historyCategories_index_usecase.dart';
import 'package:senior/domain/usecase/history_categories/historyCategories_update_usecase.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/freezeClasses.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';
import '../../common/state_renderer/state_renderer.dart';

class HistoryCategoriesViewModel extends BaseViewModel
    with HistoryCategoriesViewModelInput, HistoryCategoriesViewModelOutput {
  final _historyCategoriesStreamController = BehaviorSubject<HistoryCategoriesIndex>();
  final StreamController _titleStreamController =
  StreamController<String>.broadcast();

  final StreamController _areAllInputsValidStreamController =
  StreamController<void>.broadcast();

  final StreamController _titleUpdateStreamController =
  StreamController<String>.broadcast();

  final StreamController _areAllInputsUpdateValidStreamController =
  StreamController<void>.broadcast();

  StreamController isUserHistoryCategoriesSuccessfullyStreamController =
  StreamController<bool>();

  var historyCategoriesObject = HistoryCategoriesObject("", "");

  var historyCategoriesUpdateObject = HistoryCategoriesUpdateObject("", "");

  final HistoryCategoriesIndexUseCase historyCategoriesUseCase;

  final HistoryCategoriesCreateUseCase historyCategoriesCreateUseCase;

  final HistoryCategoriesCancelUseCase historyCategoriesCancelUseCase;

  final HistoryCategoriesUpdateUseCase historyCategoriesUpdateUseCase;


  HistoryCategoriesViewModel(this.historyCategoriesUseCase , this.historyCategoriesCreateUseCase , this.historyCategoriesCancelUseCase , this.historyCategoriesUpdateUseCase);

  @override
  start() async {
    _loadData();
  }

  _loadData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await historyCategoriesUseCase.execute(Void)).fold(
          (failure) {
        inputState.add(ErrorState(
            StateRendererType.fullScreenErrorState, failure.message));
      },
          (historyCategories) async {
        inputState.add(ContentState());
        inputHistoryCategories.add(historyCategories);
      },
    );
  }

  @override
  void dispose() {
    _historyCategoriesStreamController.close();
    _titleStreamController.close();
    _titleUpdateStreamController.close();
    _areAllInputsValidStreamController.close();
    _areAllInputsUpdateValidStreamController.close();
    isUserHistoryCategoriesSuccessfullyStreamController.close();
  }

  @override
  Sink get inputHistoryCategories => _historyCategoriesStreamController.sink;

  //output
  @override
  Stream<HistoryCategoriesIndex> get outputHistoryCategories =>
      _historyCategoriesStreamController.stream.map((historyCategories) => historyCategories);

  @override
  create() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await historyCategoriesCreateUseCase.execute(
    HistoryCategoriesCreateUseCaseInput(historyCategoriesObject.title, historyCategoriesObject.description)))
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
    isUserHistoryCategoriesSuccessfullyStreamController.add(true);

        (){
      start();
    }.call();
    });
  }

  @override
  cancel(int id) async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await historyCategoriesCancelUseCase.execute(HistoryCategoriesCancelUseCaseInput(id)))
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
    (await historyCategoriesUpdateUseCase.execute(
        HistoryCategoriesUpdateUseCaseInput(id, historyCategoriesUpdateObject.title, historyCategoriesUpdateObject.description)))
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
      isUserHistoryCategoriesSuccessfullyStreamController.add(true);

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
    historyCategoriesObject = historyCategoriesObject.copyWith(title: title);
    inputAreAllInputsValid.add(null);
  }

  @override
  setTitleUpdate(String title) {
    inputTitleUpdate.add(title);
    historyCategoriesUpdateObject = historyCategoriesUpdateObject.copyWith(title: title);
    inputAreAllInputsUpdateValid.add(null);
  }



  bool _isTitleValid(String title) {
    return title.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isTitleValid(historyCategoriesObject.title);
  }

  bool _isTitleUpdateValid(String title) {
    return title.isNotEmpty;
  }

  bool _areAllInputsUpdateValid() {
    return _isTitleUpdateValid(historyCategoriesUpdateObject.title);
  }
}

abstract class HistoryCategoriesViewModelInput {
  Sink get inputHistoryCategories;

  setTitle(String title);

  create();

  cancel(int id);

  setTitleUpdate(String title);

  update(int id);

  Sink get inputTitle;

  Sink get inputTitleUpdate;

  Sink get inputAreAllInputsValid;

  Sink get inputAreAllInputsUpdateValid;
}

abstract class HistoryCategoriesViewModelOutput {
  Stream<HistoryCategoriesIndex> get outputHistoryCategories;

  Stream<bool> get outIsTitleValid;

  Stream<bool> get outAreAllInputsValid;

  Stream<bool> get outIsTitleUpdateValid;

  Stream<bool> get outAreAllInputsUpdateValid;
}