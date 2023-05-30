import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class HistoryCancelUseCase
    implements BaseUseCase<HistoryCancelUseCaseInput, CancelHistory> {
  final Repository _repository;

  HistoryCancelUseCase(this._repository);

  @override
  Future<Either<Failure, CancelHistory>> execute(
      HistoryCancelUseCaseInput input) async {
    return await _repository.historyCancel(HistoryCancelRequest(
      input.historyId,
    ));
  }
}

class HistoryCancelUseCaseInput {
  String historyId;

  HistoryCancelUseCaseInput(this.historyId);
}
