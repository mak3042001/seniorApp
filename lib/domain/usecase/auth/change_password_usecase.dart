import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class ChangePasswordUseCase
    implements BaseUseCase<ChangePasswordUseCaseInput, ChangePassword> {
  final Repository _repository;

  ChangePasswordUseCase(this._repository);

  @override
  Future<Either<Failure, ChangePassword>> execute(
      ChangePasswordUseCaseInput input) async {
    return await _repository.changePassword(
      ChangePasswordRequest(
        input.currentPassword,
        input.password,
        input.confirmPassword,
      ),
    );
  }
}

class ChangePasswordUseCaseInput {
  String currentPassword;
  String password;
  String confirmPassword;

  ChangePasswordUseCaseInput(this.currentPassword, this.password,
      this.confirmPassword);


}
