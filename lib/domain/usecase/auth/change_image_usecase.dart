import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class ChangeImageUseCase
    implements BaseUseCase<ChangeImageUseCaseInput, ChangeImage> {
  final Repository _repository;

  ChangeImageUseCase(this._repository);

  @override
  Future<Either<Failure, ChangeImage>> execute(
      ChangeImageUseCaseInput input) async {
    return await _repository.changeImage(
      ChangeImageRequest(
        input.image,
      ),
    );
  }
}

class ChangeImageUseCaseInput {
  File image;

  ChangeImageUseCaseInput(
    this.image,
  );
}
