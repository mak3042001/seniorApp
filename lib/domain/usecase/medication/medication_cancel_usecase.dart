import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class MedicationCancelUseCase
    implements BaseUseCase<MedicationCancelUseCaseInput, CancelMedications> {
  final Repository _repository;

  MedicationCancelUseCase(this._repository);

  @override
  Future<Either<Failure, CancelMedications>> execute(
      MedicationCancelUseCaseInput input) async {
    return await _repository.medicationsCancel(MedicationsCancelRequest(
      input.medicationId,
    ));
  }
}

class MedicationCancelUseCaseInput {
  int medicationId;

  MedicationCancelUseCaseInput(this.medicationId);
}
