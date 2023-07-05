import 'package:rxdart/subjects.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/usecase/medication/medication_show.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';

import '../../common/state_renderer/state_renderer.dart';

class AiViewModel extends BaseViewModel
    with AiViewModelInput, AiViewModelOutput {
  final _aiStreamController = BehaviorSubject<Medication>();

  final MedicationUseCase aiUseCase;

  AiViewModel(this.aiUseCase ,);

  @override
  start() async {}


  @override
  void dispose() {
    _aiStreamController.close();
  }

  @override
  Sink get inputAi => _aiStreamController.sink;

  //output
  @override
  Stream<Medication> get outputAi =>
      _aiStreamController.stream.map((ai) => ai);

  @override
  showDetails(String name) async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await aiUseCase.execute(name)).fold(
    (failure) {
    inputState.add(ErrorState(
    StateRendererType.fullScreenErrorState, failure.message));
    },
    (ai) async {
    inputState.add(ContentState());
    inputAi.add(ai);
    },
    );
  }
}

abstract class AiViewModelInput {
  Sink get inputAi;
  showDetails(String name);
}

abstract class AiViewModelOutput {
  Stream<Medication> get outputAi;
}