import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class NotificationUseCase implements BaseUseCase<void, NotificationIndex> {
  final Repository _repository;

  NotificationUseCase(this._repository);

  @override
  Future<Either<Failure, NotificationIndex>> execute(void input) async {
    return await _repository.notificationIndex();
  }
}

