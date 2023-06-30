import 'package:dartz/dartz.dart';
import 'package:senior/domain/model/model.dart';

import '../../../data/network/failure.dart';
import '../../repository/domain_repository.dart';
import 'base_usecase.dart';

class UserUseCase
    implements BaseUseCase<void, UserUser> {
  final Repository _repository;

  UserUseCase(this._repository ,);

  @override
  Future<Either<Failure, UserUser>> execute(
      void input) async {
    return await _repository.user();
  }
}