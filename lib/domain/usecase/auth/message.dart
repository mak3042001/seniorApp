import 'package:dartz/dartz.dart';
import 'package:senior/domain/model/model.dart';

import '../../../data/network/failure.dart';
import '../../repository/domain_repository.dart';
import 'base_usecase.dart';

class MessageUseCase
    implements BaseUseCase<void, Message> {
  final Repository _repository;

  MessageUseCase(this._repository ,);

  @override
  Future<Either<Failure, Message>> execute(
      void input) async {
    return await _repository.message();
  }
}