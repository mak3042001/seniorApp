import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class HistoryCategoriesCreateUseCase
    implements
        BaseUseCase<HistoryCategoriesCreateUseCaseInput,
            HistoryCategoriesCreate> {
  final Repository _repository;

  HistoryCategoriesCreateUseCase(this._repository);

  @override
  Future<Either<Failure, HistoryCategoriesCreate>> execute(
      HistoryCategoriesCreateUseCaseInput input) async {
    return await _repository
        .historyCategoriesCreate(HistoryCategoriesCreateRequest(
      input.title,
      input.description,
    ));
  }
}

class HistoryCategoriesCreateUseCaseInput {
  String title;
  String description;

  HistoryCategoriesCreateUseCaseInput(
    this.title,
    this.description,
  );
}
