import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class HistoryCreateUseCase
    implements BaseUseCase<HistoryCreateUseCaseInput, HistoryCreate> {
  final Repository _repository;

  HistoryCreateUseCase(this._repository);

  @override
  Future<Either<Failure, HistoryCreate>> execute(
      HistoryCreateUseCaseInput input) async {
    return await _repository.historyCreate(HistoryCreateRequest(
      input.historyCategoryId,
      input.title,
      input.description,
    ));
  }
}

class HistoryCreateUseCaseInput {
  String historyCategoryId;
  String title;
  String description;

  HistoryCreateUseCaseInput(
    this.historyCategoryId,
    this.title,
    this.description,
  );
}
