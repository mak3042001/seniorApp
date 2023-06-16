import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class MedicationUpdateUseCase
    implements BaseUseCase<MedicationUpdateUseCaseInput, MedicationsUpdate> {
  final Repository _repository;

  MedicationUpdateUseCase(this._repository);

  @override
  Future<Either<Failure, MedicationsUpdate>> execute(
      MedicationUpdateUseCaseInput input) async {
    return await _repository.medicationsUpdate(MedicationsUpdateRequest(
      input.medicationId,
      input.medication,
      input.medicationDose,
    ));
  }
}

class MedicationUpdateUseCaseInput {
  int medicationId;
  String medication;
  String medicationDose;

  MedicationUpdateUseCaseInput(
    this.medicationId,
    this.medication,
    this.medicationDose,
  );
}
