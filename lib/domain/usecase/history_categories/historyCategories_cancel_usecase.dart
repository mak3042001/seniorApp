import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class HistoryCategoriesCancelUseCase
    implements
        BaseUseCase<HistoryCategoriesCancelUseCaseInput,
            CancelHistoryCategories> {
  final Repository _repository;

  HistoryCategoriesCancelUseCase(this._repository);

  @override
  Future<Either<Failure, CancelHistoryCategories>> execute(
      HistoryCategoriesCancelUseCaseInput input) async {
    return await _repository
        .historyCategoriesCancel(HistoryCategoriesCancelRequest(
      input.historyCategoriesId,
    ));
  }
}

class HistoryCategoriesCancelUseCaseInput {
  int historyCategoriesId;

  HistoryCategoriesCancelUseCaseInput(this.historyCategoriesId);
}
