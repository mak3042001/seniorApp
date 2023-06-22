import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class SchedulesCancelUseCase
    implements BaseUseCase<SchedulesCancelUseCaseInput, SchedulesCancel> {
  final Repository _repository;

  SchedulesCancelUseCase(this._repository);

  @override
  Future<Either<Failure, SchedulesCancel>> execute(
      SchedulesCancelUseCaseInput input) async {
    return await _repository.schedulesCancel(SchedulesCancelRequest(
      input.scheduleId,
    ));
  }
}

class SchedulesCancelUseCaseInput {
  int scheduleId;

  SchedulesCancelUseCaseInput(this.scheduleId);
}
