import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class HistoryIndexUseCase
    implements BaseUseCase<void, HistoryIndex> {
  final Repository _repository;

  HistoryIndexUseCase(this._repository);

  @override
  Future<Either<Failure, HistoryIndex>> execute(
      void input) async {
    return await _repository.historyIndex();
  }
}
