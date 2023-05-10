import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginFunction,Auth>{

  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Auth>> execute(LoginFunction input) async {
    return await _repository.login(LoginRequest(input.username, input.password));
  }

}

class LoginFunction{
  String username;
  String password;

  LoginFunction(this.username, this.password);
}