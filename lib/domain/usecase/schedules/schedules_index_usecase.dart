import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class SchedulesIndexUseCase
    implements BaseUseCase<void, IndexSchedules> {
  final Repository _repository;

  SchedulesIndexUseCase(this._repository);

  @override
  Future<Either<Failure, IndexSchedules>> execute(
      void input) async {
    return await _repository.schedulesIndex();
  }
}
