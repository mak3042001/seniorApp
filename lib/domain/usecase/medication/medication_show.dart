import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class MedicationUseCase implements BaseUseCase<MedicationUseCaseInput,Medication>{

  final Repository _repository;

  MedicationUseCase(this._repository);

  @override
  Future<Either<Failure, Medication>> execute(MedicationUseCaseInput input) async {
    return await _repository.medicine(MedicineRequest(input.name,));
  }

}

class MedicationUseCaseInput {
  String name;

  MedicationUseCaseInput(this.name,);
}