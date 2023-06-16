import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class HistoryCategoriesUpdateUseCase
    implements
        BaseUseCase<HistoryCategoriesUpdateUseCaseInput,
            HistoryCategoriesUpdate> {
  final Repository _repository;

  HistoryCategoriesUpdateUseCase(this._repository);

  @override
  Future<Either<Failure, HistoryCategoriesUpdate>> execute(
      HistoryCategoriesUpdateUseCaseInput input) async {
    return await _repository
        .historyCategoriesUpdate(HistoryCategoriesUpdateRequest(
      input.historyCategoryId,
      input.title,
      input.description,
    ));
  }
}

class HistoryCategoriesUpdateUseCaseInput {
  int historyCategoryId;
  String title;
  String description;

  HistoryCategoriesUpdateUseCaseInput(
    this.historyCategoryId,
    this.title,
    this.description,
  );
}
