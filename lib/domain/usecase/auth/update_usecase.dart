import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class UpdateUseCase implements BaseUseCase<UpdateUseCaseInput, Auth> {
  final Repository _repository;

  UpdateUseCase(this._repository);

  @override
  Future<Either<Failure, Auth>> execute(UpdateUseCaseInput input) async {
    return await _repository.updateProfile(UpdateProfileRequest(
      input.name,
      input.username,
      input.birthdate,
      input.phone,
    ));
  }
}

class UpdateUseCaseInput {
  String name;
  String username;
  String birthdate;
  String phone;


  UpdateUseCaseInput(
    this.name,
    this.username,
    this.birthdate,
    this.phone,
  );
}
