import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezeClasses.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String email, String password) = _Loginobject;
}

@freezed
class RegisterObject with _$RegisterObject {
  factory RegisterObject(
    String username,
    String name,
    String phone,
    String birthdate,
    String password,
    String confirmPassword,
  ) = _RegisterObject;
}

@freezed
class SchedulesCreateObject with _$SchedulesCreateObject {
  factory SchedulesCreateObject(
    String title,
    String date,
    String time,
    String type,
  ) = _SchedulesCreateObject;
}


@freezed
class BookingCreateObject with _$BookingCreateObject {
  factory BookingCreateObject(
    String doctorId,
    String date,
  ) = _BookingCreateObject;
}

@freezed
class ProfileObject with _$ProfileObject {
  factory ProfileObject(
      String username,
      String name,
      String phone,
      String birthdate,
      String currentPassword,
      String password,
      String confirmPassword,
      ) = _ProfileObject;
}

@freezed
class HistoryCategoriesObject with _$HistoryCategoriesObject {
  factory HistoryCategoriesObject(String title, String description) = _HistoryCategoriesObject;
}