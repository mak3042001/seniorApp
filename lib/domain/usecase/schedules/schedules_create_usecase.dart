import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class SchedulesCreateUseCase
    implements BaseUseCase<SchedulesCreateUseCaseInput, SchedulesCreate> {
  final Repository _repository;

  SchedulesCreateUseCase(this._repository);

  @override
  Future<Either<Failure, SchedulesCreate>> execute(
      SchedulesCreateUseCaseInput input) async {
    return await _repository.schedulesCreate(SchedulesCreateRequest(
      input.title,
      input.date,
      input.time,
      input.type,
      input.description,
    ));
  }
}

class SchedulesCreateUseCaseInput {
  String title;
  String date;
  String time;
  String type;
  String description;

  SchedulesCreateUseCaseInput(
    this.title,
    this.date,
    this.time,
    this.type,
    this.description,
  );
}
