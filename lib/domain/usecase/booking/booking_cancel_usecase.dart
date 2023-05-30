import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/base_usecase.dart';

class BookingCancelUseCase
    implements BaseUseCase<BookingCancelUseCaseInput, CancelBooking> {
  final Repository _repository;

  BookingCancelUseCase(this._repository);

  @override
  Future<Either<Failure, CancelBooking>> execute(
      BookingCancelUseCaseInput input) async {
    return await _repository.bookingCancel(BookingCancelRequest(
      input.bookingId,
    ));
  }
}

class BookingCancelUseCaseInput {
  String bookingId;

  BookingCancelUseCaseInput(this.bookingId);
}
