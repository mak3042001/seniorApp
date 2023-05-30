import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class HistoryCategoriesIndexUseCase
    implements BaseUseCase<void, HistoryCategoriesIndex> {
  final Repository _repository;

  HistoryCategoriesIndexUseCase(this._repository);

  @override
  Future<Either<Failure, HistoryCategoriesIndex>> execute(
      void input) async {
    return await _repository.historyCategoriesIndex();
  }
}
