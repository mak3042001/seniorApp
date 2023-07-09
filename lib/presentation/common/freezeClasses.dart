
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezeClasses.freezed.dart';


@freezed
class ChatObject with _$ChatObject {
  factory ChatObject(String fromId, String toId , String message) = _Chatobject;

}


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
    String description,
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
      ) = _ProfileObject;
}

@freezed
class PasswordObject with _$PasswordObject {
  factory PasswordObject(
      String currentPassword,
      String password,
      String confirmPassword,
      ) = _PasswordObject;
}

@freezed
class ImageObject with _$ImageObject {
  factory ImageObject(
     String image,
      ) = _ImageObject;
}

@freezed
class HistoryCategoriesObject with _$HistoryCategoriesObject {
  factory HistoryCategoriesObject(String title, String description) = _HistoryCategoriesObject;
}

@freezed
class HistoryCategoriesUpdateObject with _$HistoryCategoriesUpdateObject {
  factory HistoryCategoriesUpdateObject(String title, String description) = _HistoryCategoriesUpdateObject;
}

@freezed
class HistoryObject with _$HistoryObject {
  factory HistoryObject(String title, String description) = _HistoryObject;
}

@freezed
class HistoryUpdateObject with _$HistoryUpdateObject {
  factory HistoryUpdateObject(String title, String description) = _HistoryUpdateObject;
}

@freezed
class MedicationsObject with _$MedicationsObject {
  factory MedicationsObject(String medication, String medicationDose , String? description) = _MedicationsObject;
}

@freezed
class MedicationsUpdateObject with _$MedicationsUpdateObject {
  factory MedicationsUpdateObject(String? medication, String? medicationDose , String? description) = _MedicationsUpdateObject;
}