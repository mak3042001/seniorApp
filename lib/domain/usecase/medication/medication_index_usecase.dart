import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class MedicationIndexUseCase
    implements BaseUseCase<void, MedicationsIndex> {
  final Repository _repository;

  MedicationIndexUseCase(this._repository);

  @override
  Future<Either<Failure, MedicationsIndex>> execute(
      void input) async {
    return await _repository.medicationsIndex();
  }
}
