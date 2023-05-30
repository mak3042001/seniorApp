import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class MedicationCreateUseCase
    implements BaseUseCase<MedicationCreateUseCaseInput, MedicationsCreate> {
  final Repository _repository;

  MedicationCreateUseCase(this._repository);

  @override
  Future<Either<Failure, MedicationsCreate>> execute(
      MedicationCreateUseCaseInput input) async {
    return await _repository.medicationsCreate(MedicationsCreateRequest(
      input.medication,
      input.medicationDose,
    ));
  }
}

class MedicationCreateUseCaseInput {
  String medication;
  String medicationDose;

  MedicationCreateUseCaseInput(
    this.medication,
    this.medicationDose,
  );
}
