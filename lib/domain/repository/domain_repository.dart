import 'package:dartz/dartz.dart';
import 'package:senior/data/network/failure.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/domain/model/model.dart';

abstract class Repository{
  Future<Either<Failure,UserUser>> user();

  Future<Either<Failure,Auth>> login(LoginRequest loginRequest);

  Future<Either<Failure,Auth>> register(RegisterRequest registerRequest);

  Future<Either<Failure,Auth>> updateProfile(UpdateProfileRequest updateProfileRequest);

  Future<Either<Failure,ChangeImage>> changeImage(
      ChangeImageRequest changeImageRequest);

  Future<Either<Failure,ChangePassword>> changePassword(
      ChangePasswordRequest changePasswordRequest);

  Future<Either<Failure,Profile>> profileIndex();

  Future<Either<Failure,NotificationIndex>> notificationIndex();

  Future<Either<Failure,SchedulesCreate>> schedulesCreate(SchedulesCreateRequest schedulesCreateRequest);
  Future<Either<Failure,SchedulesCancel>> schedulesCancel(SchedulesCancelRequest schedulesCancelRequest);
  Future<Either<Failure,IndexSchedules>> schedulesIndex();
  Future<Either<Failure,CreateBooking>> bookingCreate(BookingCreateRequest bookingCreateRequest);
  Future<Either<Failure,CancelBooking>> bookingCancel(BookingCancelRequest bookingCancelRequest);
  Future<Either<Failure,IndexBooking>> bookingsIndex();
  Future<Either<Failure,HistoryCreate>> historyCreate(HistoryCreateRequest historyCreateRequest);
  Future<Either<Failure,CancelHistory>> historyCancel(HistoryCancelRequest historyCancelRequest);
  Future<Either<Failure,HistoryUpdate>> historyUpdate(HistoryUpdateRequest historyUpdateRequest);
  Future<Either<Failure,HistoryIndex>> historyIndex();
  Future<Either<Failure,HistoryCategoriesCreate>> historyCategoriesCreate(HistoryCategoriesCreateRequest historyCategoriesCreateRequest);
  Future<Either<Failure,CancelHistoryCategories>> historyCategoriesCancel(HistoryCategoriesCancelRequest historyCategoriesCancelRequest);
  Future<Either<Failure,HistoryCategoriesUpdate>> historyCategoriesUpdate(HistoryCategoriesUpdateRequest historyCategoriesUpdateRequest);
  Future<Either<Failure,HistoryCategoriesIndex>> historyCategoriesIndex();
  Future<Either<Failure,MedicationsCreate>> medicationsCreate(MedicationsCreateRequest medicationsCreateRequest);
  Future<Either<Failure,CancelMedications>> medicationsCancel(MedicationsCancelRequest medicationsCancelRequest);
  Future<Either<Failure,MedicationsUpdate>> medicationsUpdate(MedicationsUpdateRequest medicationsUpdateRequest);
  Future<Either<Failure,MedicationsIndex>> medicationsIndex();
  Future<Either<Failure,MedicationsCodeCreate>> medicationsCodeCreate();
  Future<Either<Failure,MedicationsCodeIndex>> medicationsCodeIndex();
  Future<Either<Failure,DoctorIndex>> doctorIndex();
}