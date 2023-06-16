import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class DoctorIndexUseCase
    implements BaseUseCase<void, DoctorIndex> {
  final Repository _repository;

  DoctorIndexUseCase(this._repository ,);

  @override
  Future<Either<Failure, DoctorIndex>> execute(
      void input) async {
    return await _repository.doctorIndex();
  }
}
