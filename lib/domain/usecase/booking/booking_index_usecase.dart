import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class BookingIndexUseCase
    implements BaseUseCase<void, IndexBooking> {
  final Repository _repository;
  int x;

  BookingIndexUseCase(this._repository , this.x);

  @override
  Future<Either<Failure, IndexBooking>> execute(
      void input) async {
    return await _repository.bookingsIndex(x);
  }
}
