import 'dart:async';
import 'dart:ffi';
import 'package:rxdart/subjects.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/usecase/medication_code/medication_code_create_usecase.dart';
import 'package:senior/domain/usecase/medication_code/medication_code_index_usecase.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';
import '../../common/state_renderer/state_renderer.dart';

class MedicationsCodeViewModel extends BaseViewModel
    with MedicationsCodeViewModelInput, MedicationsCodeViewModelOutput {

  final _medicationsCodeStreamController =
      BehaviorSubject<MedicationsCodeIndex>();


  final MedicationsCodeCreateUseCase medicationsCodeCreateUseCase;
  final MedicationsCodeIndexUseCase medicationsCodeIndexUseCase;

  MedicationsCodeViewModel(
    this.medicationsCodeCreateUseCase,
    this.medicationsCodeIndexUseCase,
  );

  @override
  start() async {
    _loadData();
  }

  _loadData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await medicationsCodeIndexUseCase.execute(Void)).fold(
      (failure) {
        inputState.add(ErrorState(
            StateRendererType.fullScreenErrorState, failure.message));
      },
      (medicationsCode) async {
        inputState.add(ContentState());
        inputMedicationsCode.add(medicationsCode);
      },
    );
  }

  @override
  void dispose() {
    _medicationsCodeStreamController.close();
  }

  @override
  Sink get inputMedicationsCode => _medicationsCodeStreamController.sink;

  //output
  @override
  Stream<MedicationsCodeIndex> get outputMedicationsCode =>
      _medicationsCodeStreamController.stream
          .map((medicationsCode) => medicationsCode);

  @override
  get()  async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await medicationsCodeCreateUseCase.execute(Void))
        .fold(
            (failure){
          // left -> failure
          inputState.add(ErrorState(
              StateRendererType.popupErrorState, failure.message));
          (){
            start();
          }.call();
        }, (data) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
    });
  }

}

abstract class MedicationsCodeViewModelInput {
  Sink get inputMedicationsCode;
  get();
}

abstract class MedicationsCodeViewModelOutput {
  Stream<MedicationsCodeIndex> get outputMedicationsCode;
}
