import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class BookingCreateUseCase
    implements BaseUseCase<BookingCreateUseCaseInput, CreateBooking> {
  final Repository _repository;

  BookingCreateUseCase(this._repository);

  @override
  Future<Either<Failure, CreateBooking>> execute(
      BookingCreateUseCaseInput input) async {
    return await _repository.bookingCreate(BookingCreateRequest(
      input.doctorId,
      input.date,
    ));
  }
}

class BookingCreateUseCaseInput {
  String doctorId;
  String date;

  BookingCreateUseCaseInput(
    this.doctorId,
    this.date,
  );
}
