import 'dart:async';
import 'dart:ffi';
import 'package:rxdart/subjects.dart';

import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/usecase/medication/medication_cancel_usecase.dart';
import 'package:senior/domain/usecase/medication/medication_create_usecase.dart';
import 'package:senior/domain/usecase/medication/medication_index_usecase.dart';
import 'package:senior/domain/usecase/medication/medication_update_usecase.dart';
import 'package:senior/presentation/base/baseViewModel.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';
import '../../common/freezeClasses.dart';
import '../../common/state_renderer/state_renderer.dart';

class MedicationsViewModel extends BaseViewModel
    with MedicationsViewModelInput, MedicationsViewModelOutput {
  final _medicationsStreamController = BehaviorSubject<MedicationsIndex>();
  final StreamController _nameStreamController =
  StreamController<String>.broadcast();

  final StreamController _doseStreamController =
  StreamController<String>.broadcast();

  final StreamController _descriptionStreamController =
  StreamController<String>.broadcast();

  final StreamController _areAllInputsValidStreamController =
  StreamController<void>.broadcast();

  final StreamController _nameUpdateStreamController =
  StreamController<String>.broadcast();

  final StreamController _doseUpdateStreamController =
  StreamController<String>.broadcast();

  final StreamController _descriptionUpdateStreamController =
  StreamController<String>.broadcast();

  final StreamController _areAllInputsUpdateValidStreamController =
  StreamController<void>.broadcast();

  StreamController isUserMedicationsSuccessfullyStreamController =
  StreamController<bool>();

  var medicationsObject = MedicationsObject("", "" , "");

  var medicationsUpdateObject = MedicationsUpdateObject("", "" , "");

  final MedicationIndexUseCase medicationsUseCase;

  final MedicationCreateUseCase medicationsCreateUseCase;

  final MedicationCancelUseCase medicationsCancelUseCase;

  final MedicationUpdateUseCase medicationsUpdateUseCase;


  MedicationsViewModel(this.medicationsUseCase , this.medicationsCreateUseCase , this.medicationsCancelUseCase , this.medicationsUpdateUseCase);

  @override
  start() async {
    _loadData();
  }

  _loadData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.fullScreenLoadingState));
    (await medicationsUseCase.execute(Void)).fold(
          (failure) {
        inputState.add(ErrorState(
            StateRendererType.fullScreenErrorState, failure.message));
      },
          (medications) async {
        inputState.add(ContentState());
        inputMedications.add(medications);
      },
    );
  }

  @override
  void dispose() {
    _medicationsStreamController.close();
    _nameStreamController.close();
    _doseStreamController.close();
    _descriptionStreamController.close();
    _nameUpdateStreamController.close();
    _doseUpdateStreamController.close();
    _descriptionUpdateStreamController.close();
    _areAllInputsValidStreamController.close();
    _areAllInputsUpdateValidStreamController.close();
    isUserMedicationsSuccessfullyStreamController.close();
  }

  @override
  Sink get inputMedications => _medicationsStreamController.sink;

  //output
  @override
  Stream<MedicationsIndex> get outputMedications =>
      _medicationsStreamController.stream.map((medications) => medications);

  @override
  create() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await medicationsCreateUseCase.execute(
        MedicationCreateUseCaseInput(medicationsObject.medication, medicationsObject.medicationDose , medicationsObject.description)))
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
      isUserMedicationsSuccessfullyStreamController.add(true);

          (){
        start();
      }.call();
    });
  }

  @override
  cancel(int id) async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await medicationsCancelUseCase.execute(MedicationCancelUseCaseInput(id)))
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
    (await medicationsUpdateUseCase.execute(
        MedicationUpdateUseCaseInput(id, medicationsUpdateObject.medication, medicationsUpdateObject.medicationDose , medicationsUpdateObject.description)))
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
      isUserMedicationsSuccessfullyStreamController.add(true);

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
  Sink get inputName => _nameStreamController.sink;

  @override
  Sink get inputNameUpdate => _nameUpdateStreamController.sink;

  @override
  Stream<bool> get outAreAllInputsValid => _areAllInputsValidStreamController.stream
      .map((_) => _areAllInputsValid());

  @override
  Stream<bool> get outAreAllInputsUpdateValid => _areAllInputsUpdateValidStreamController.stream
      .map((_) => _areAllInputsUpdateValid());

  @override
  Stream<bool> get outIsNameValid => _nameStreamController.stream
      .map((name) => _isNameValid(name));

  @override
  Stream<bool> get outIsNameUpdateValid => _nameUpdateStreamController.stream
      .map((name) => _isNameUpdateValid(name));

  @override
  setName(String name) {
    inputName.add(name);
    medicationsObject = medicationsObject.copyWith(medication: name);
    inputAreAllInputsValid.add(null);
  }

  @override
  setNameUpdate(String? name) {
    inputNameUpdate.add(name);
    medicationsUpdateObject = medicationsUpdateObject.copyWith(medication: name);
    inputAreAllInputsUpdateValid.add(null);
  }



  bool _isNameValid(String name) {
    return name.isNotEmpty;
  }

  bool _isDoseValid(String dose) {
    return dose.isNotEmpty;
  }

  bool _isDescriptionValid(String description) {
    return description.isNotEmpty;
  }

  bool _areAllInputsValid() {
    return _isNameValid(medicationsObject.medication) && _isDoseValid(medicationsObject.medicationDose);
  }

  bool _isNameUpdateValid(String name) {
    return name.isNotEmpty;
  }
  bool _isDoseUpdateValid(String dose) {
    return dose.isNotEmpty;
  }

  bool _isDescriptionUpdateValid(String description) {
    return description.isNotEmpty;
  }

  bool _areAllInputsUpdateValid() {
    return true;
  }

  @override
  Sink get inputDose => _doseStreamController.sink;

  @override
  Sink get inputDescription => _descriptionStreamController.sink;

  @override
  Sink get inputDoseUpdate => _doseUpdateStreamController.sink;

  @override
  Sink get inputDescriptionUpdate => _descriptionUpdateStreamController.sink;

  @override
  Stream<bool> get outIsDoseUpdateValid => _doseUpdateStreamController.stream
      .map((dose) => _isDoseUpdateValid(dose));

  @override
  Stream<bool> get outIsDescriptionUpdateValid => _descriptionUpdateStreamController.stream
      .map((description) => _isDescriptionUpdateValid(description));

  @override
  Stream<bool> get outIsDoseValid => _doseStreamController.stream
      .map((dose) => _isDoseValid(dose));

  @override
  Stream<bool> get outIsDescriptionValid => _descriptionStreamController.stream
      .map((description) => _isDescriptionValid(description));

  @override
  setDose(String dose) {
    inputDose.add(dose);
    medicationsObject = medicationsObject.copyWith(medicationDose: dose);
    inputAreAllInputsValid.add(null);
  }

  @override
  setDescription(String? description) {
    inputDescription.add(description);
    medicationsObject = medicationsObject.copyWith(description: description);
    inputAreAllInputsValid.add(null);
  }

  @override
  setDoseUpdate(String? dose) {
    inputDoseUpdate.add(dose);
    medicationsUpdateObject = medicationsUpdateObject.copyWith(medicationDose: dose);
    inputAreAllInputsUpdateValid.add(null);
  }

  @override
  setDescriptionUpdate(String? description) {
    inputDescriptionUpdate.add(description);
    medicationsUpdateObject = medicationsUpdateObject.copyWith(description: description);
    inputAreAllInputsUpdateValid.add(null);
  }
}

abstract class MedicationsViewModelInput {
  Sink get inputMedications;

  setName(String name);
  setDose(String dose);
  setDescription(String? description);

  create();

  cancel(int id);

  setNameUpdate(String? name);
  setDoseUpdate(String? dose);
  setDescriptionUpdate(String? description);

  update(int id);

  Sink get inputName;
  Sink get inputDose;
  Sink get inputDescription;

  Sink get inputNameUpdate;
  Sink get inputDoseUpdate;
  Sink get inputDescriptionUpdate;

  Sink get inputAreAllInputsValid;

  Sink get inputAreAllInputsUpdateValid;
}

abstract class MedicationsViewModelOutput {
  Stream<MedicationsIndex> get outputMedications;

  Stream<bool> get outIsNameValid;
  Stream<bool> get outIsDoseValid;
  Stream<bool> get outIsDescriptionValid;

  Stream<bool> get outAreAllInputsValid;

  Stream<bool> get outIsNameUpdateValid;
  Stream<bool> get outIsDoseUpdateValid;
  Stream<bool> get outIsDescriptionUpdateValid;

  Stream<bool> get outAreAllInputsUpdateValid;
}