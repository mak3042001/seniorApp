import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/base_usecase.dart';

class RegisterUseCase implements BaseUseCase<RegisterUseCaseInput, Auth> {
  final Repository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, Auth>> execute(RegisterUseCaseInput input) async {
    return await _repository.register(RegisterRequest(
      input.username,
      input.name,
      input.phone,
      input.birthdate,
      input.password,
      input.confirmPassword,
    ));
  }
}

class RegisterUseCaseInput {
  String username;
  String name;
  String phone;
  String birthdate;
  String password;
  String confirmPassword;

  RegisterUseCaseInput(
      this.username,
      this.name,
      this.phone,
      this.birthdate,
      this.password,
      this.confirmPassword,
  );
}
