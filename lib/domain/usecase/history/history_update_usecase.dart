import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class HistoryUpdateUseCase
    implements BaseUseCase<HistoryUpdateUseCaseInput, HistoryUpdate> {
  final Repository _repository;

  HistoryUpdateUseCase(this._repository);

  @override
  Future<Either<Failure, HistoryUpdate>> execute(
      HistoryUpdateUseCaseInput input) async {
    return await _repository.historyUpdate(HistoryUpdateRequest(
      input.historyCategoryId,
      input.title,
      input.description,
    ));
  }
}

class HistoryUpdateUseCaseInput {
  String historyCategoryId;
  String title;
  String description;

  HistoryUpdateUseCaseInput(
    this.historyCategoryId,
    this.title,
    this.description,
  );
}
