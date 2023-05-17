import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput,Auth>{

  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Auth>> execute(LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.username, input.password));
  }

}

class LoginUseCaseInput {
  String username;
  String password;

  LoginUseCaseInput(this.username, this.password);
}