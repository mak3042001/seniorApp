
import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class MedicationsCodeCreateUseCase
    implements BaseUseCase<void, MedicationsCodeCreate> {
  final Repository _repository;

  MedicationsCodeCreateUseCase(this._repository);

  @override
  Future<Either<Failure, MedicationsCodeCreate>> execute(void input) async {
    return await _repository.medicationsCodeCreate();
  }
}
