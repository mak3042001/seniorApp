import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class ProfileIndexUseCase
    implements BaseUseCase<void, Profile> {
  final Repository _repository;

  ProfileIndexUseCase(this._repository ,);

  @override
  Future<Either<Failure, Profile>> execute(
      void input) async {
    return await _repository.profileIndex();
  }
}
