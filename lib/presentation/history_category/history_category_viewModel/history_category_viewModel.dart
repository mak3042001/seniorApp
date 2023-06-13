import 'dart:async';
import 'dart:ffi';
import 'package:rxdart/subjects.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/usecase/history_categories/historyCategories_create_usecase.dart';
import 'package:senior/domain/usecase/history_categories/historyCategories_index_usecase.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/freezeClasses.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';
import '../../common/state_renderer/state_renderer.dart';

class HistoryCategoriesViewModel extends BaseViewModel
    with HistoryCategoriesViewModelInput, HistoryCategoriesViewModelOutput {
  final _historyCategoriesStreamController = BehaviorSubject<HistoryCategoriesIndex>();
  final StreamController _titleStreamController =
  StreamController<String>.broadcast();
  final StreamController _descriptionStreamController =
  StreamController<String>.broadcast();

  final StreamController _areAllInputsValidStreamController =
  StreamController<void>.broadcast();

  StreamController isUserHistoryCategoriesSuccessfullyStreamController =
  StreamController<bool>();

  var historyCategoriesObject = HistoryCategoriesObject("", "");

  final HistoryCategoriesIndexUseCase historyCategoriesUseCase;

  final HistoryCategoriesCreateUseCase historyCategoriesCreateUseCase;

  HistoryCategoriesViewModel(this.historyCategoriesUseCase , this.historyCategoriesCreateUseCase);

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
    _descriptionStreamController.close();
    _areAllInputsValidStreamController.close();
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
    historyCategoriesObject = historyCategoriesObject.copyWith(description: description);
    inputAreAllInputsValid.add(null);
  }

  @override
  setTitle(String title) {
    inputTitle.add(title);
    historyCategoriesObject = historyCategoriesObject.copyWith(title: title);
    inputAreAllInputsValid.add(null);
  }


  bool _isDescriptionValid(String description) {
    return description.isNotEmpty;
  }

  bool _isTitleValid(String title) {
    return title.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isDescriptionValid(historyCategoriesObject.description) &&
        _isTitleValid(historyCategoriesObject.title);
  }
}

abstract class HistoryCategoriesViewModelInput {
  Sink get inputHistoryCategories;

  setTitle(String title);

  setDescription(String description);

  create();

  Sink get inputTitle;

  Sink get inputDescription;

  Sink get inputAreAllInputsValid;
}

abstract class HistoryCategoriesViewModelOutput {
  Stream<HistoryCategoriesIndex> get outputHistoryCategories;

  Stream<bool> get outIsTitleValid;

  Stream<bool> get outIsDescriptionValid;

  Stream<bool> get outAreAllInputsValid;
}