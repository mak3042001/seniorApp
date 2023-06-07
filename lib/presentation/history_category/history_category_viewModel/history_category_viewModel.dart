import 'dart:ffi';
import 'package:rxdart/subjects.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/usecase/history_categories/historyCategories_index_usecase.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';
import '../../common/state_renderer/state_renderer.dart';

class HistoryCategoriesViewModel extends BaseViewModel
    with HistoryCategoriesViewModelInput, HistoryCategoriesViewModelOutput {
  final _historyCategoriesStreamController = BehaviorSubject<HistoryCategoriesIndex>();

  final HistoryCategoriesIndexUseCase historyCategoriesUseCase;

  HistoryCategoriesViewModel(this.historyCategoriesUseCase);

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
  }

  @override
  Sink get inputHistoryCategories => _historyCategoriesStreamController.sink;

  //output
  @override
  Stream<HistoryCategoriesIndex> get outputHistoryCategories =>
      _historyCategoriesStreamController.stream.map((historyCategories) => historyCategories);
}

abstract class HistoryCategoriesViewModelInput {
  Sink get inputHistoryCategories;
}

abstract class HistoryCategoriesViewModelOutput {
  Stream<HistoryCategoriesIndex> get outputHistoryCategories;
}