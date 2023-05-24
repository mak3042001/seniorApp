import 'package:senior/app/constant.dart';
import 'package:senior/app/extension.dart';
import 'package:senior/data/response/response.dart';
import 'package:senior/domain/model/model.dart';

//auth mapper
extension DataResponseMabber on DataResponse? {
  Data toDomain() {
    return Data(
      this?.user.toDomain(),
      this?.token.orEmpty() ?? Constant.empty,
    );
  }
}

extension UserResponseMabber on UserResponse? {
  User toDomain() {
    return User(
      this?.id.orEmpty() ?? Constant.zero,
      this?.username.orEmpty() ?? Constant.empty,
      this?.name.orEmpty() ?? Constant.empty,
      this?.email.orEmpty() ?? Constant.empty,
      this?.phone.orEmpty() ?? Constant.empty,
      this?.birthdate.orEmpty() ?? Constant.empty,
      this?.age.orEmpty() ?? Constant.zero,
      this?.image.orEmpty() ?? Constant.empty,
    );
  }
}

extension AuthResponseMabber on AuthResponse? {
  Auth toDomain() {
    return Auth(
      this?.data.toDomain(),
    );
  }
}

//schedules index mapper
extension IndexSchedulesDataResponseMabber on IndexSchedulesDataResponse? {
  IndexSchedulesData toDomain() {
    return IndexSchedulesData(
      this?.id.orEmpty() ?? Constant.zero,
      this?.title.orEmpty() ?? Constant.empty,
      this?.description.orEmpty() ?? Constant.empty,
      this?.date.orEmpty() ?? Constant.empty,
      this?.time.orEmpty() ?? Constant.empty,
      this?.type.orEmpty() ?? Constant.empty,
      this?.createdAt.orEmpty() ?? Constant.zero,
    );
  }
}

extension IndexSchedulesResponseMabber on IndexSchedulesResponse? {
  IndexSchedules toDomain() {
    return IndexSchedules(
      (this?.data?.map((e) => e.toDomain()) ?? const Iterable.empty())
          .cast<IndexSchedulesData?>()
          .toList(),
    );
  }
}

//booking index mapper
extension DoctorResponseMabber on DoctorResponse? {
  Doctor toDomain() {
    return Doctor(
      this?.id.orEmpty() ?? Constant.zero,
      this?.username.orEmpty() ?? Constant.empty,
      this?.name.orEmpty() ?? Constant.empty,
      this?.email.orEmpty() ?? Constant.empty,
      this?.phone.orEmpty() ?? Constant.empty,
      this?.birthdate.orEmpty() ?? Constant.empty,
      this?.image.orEmpty() ?? Constant.empty,
      this?.address.orEmpty() ?? Constant.empty,
      this?.medicineCategory.orEmpty() ?? Constant.empty,
      this?.weekDays.orEmpty() ?? Constant.empty,
    );
  }
}

extension BookingDataResponseMabber on BookingDataResponse? {
  BookingData toDomain() {
    return BookingData(
      this?.id.orEmpty() ?? Constant.zero,
      this?.date.orEmpty() ?? Constant.empty,
      this?.status.orEmpty() ?? Constant.empty,
      this?.createdAt.orEmpty() ?? Constant.empty,
      this?.senior.toDomain(),
      this?.doctor.toDomain(),
    );
  }
}

extension IndexBookingResponseMabber on IndexBookingResponse? {
  IndexBooking toDomain() {
    return IndexBooking(
      (this?.data?.map((e) => e.toDomain()) ?? const Iterable.empty())
          .cast<BookingData?>()
          .toList(),
    );
  }
}
