import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

//base response
@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "successful")
  bool? successful;
  @JsonKey(name: "message")
  String? message;
}

//auth response
@JsonSerializable()
class DataResponse {
  @JsonKey(name: "user")
  UserResponse? user;
  @JsonKey(name: "token")
  String? token;

  DataResponse(this.user,
      this.token,);

  //fromJson
  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}

@JsonSerializable()
class UserResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "birthdate")
  String? birthdate;
  @JsonKey(name: "age")
  int? age;
  @JsonKey(name: "image")
  String? image;

  UserResponse(this.id,
      this.username,
      this.name,
      this.email,
      this.phone,
      this.birthdate,
      this.age,
      this.image,);

  //fromJson
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class AuthResponse extends BaseResponse {
  @JsonKey(name: "data")
  DataResponse? data;

  AuthResponse(this.data,);

  //fromJson
  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

@JsonSerializable()
class ChangeImageResponse extends BaseResponse {
  ChangeImageResponse();

  //fromJson
  factory ChangeImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangeImageResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$ChangeImageResponseToJson(this);
}

@JsonSerializable()
class ChangePasswordResponse extends BaseResponse {
  ChangePasswordResponse();

  //fromJson
  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$ChangePasswordResponseToJson(this);
}

//auth logOut response
@JsonSerializable()
class AuthLogOutResponse extends BaseResponse {
  AuthLogOutResponse();

  //fromJson
  factory AuthLogOutResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthLogOutResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$AuthLogOutResponseToJson(this);
}

//notification
@JsonSerializable()
class NotificationDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "content")
  String? content;
  @JsonKey(name: "seen")
  String? seen;
  @JsonKey(name: "created_at")
  String? createdAt;

  NotificationDataResponse(this.id,
      this.title,
      this.content,
      this.seen,
      this.createdAt,);

  //fromJson
  factory NotificationDataResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$NotificationDataResponseToJson(this);
}

@JsonSerializable()
class NotificationDataIndexResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<NotificationDataResponse?>? data;


  NotificationDataIndexResponse(this.data);

  //fromJson
  factory NotificationDataIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataIndexResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$NotificationDataIndexResponseToJson(this);
}

//schedules create
@JsonSerializable()
class CreateSchedulesResponse extends BaseResponse {
  CreateSchedulesResponse();

  //fromJson
  factory CreateSchedulesResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSchedulesResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$CreateSchedulesResponseToJson(this);
}

//schedules cancel
@JsonSerializable()
class CancelSchedulesResponse extends BaseResponse {
  CancelSchedulesResponse();

  //fromJson
  factory CancelSchedulesResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelSchedulesResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$CancelSchedulesResponseToJson(this);
}

//schedules index
@JsonSerializable()
class IndexSchedulesDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "time")
  String? time;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "created_at")
  String? createdAt;

  IndexSchedulesDataResponse(this.id,
      this.title,
      this.description,
      this.date,
      this.time,
      this.type,
      this.createdAt,);

  //fromJson
  factory IndexSchedulesDataResponse.fromJson(Map<String, dynamic> json) =>
      _$IndexSchedulesDataResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$IndexSchedulesDataResponseToJson(this);
}

@JsonSerializable()
class IndexSchedulesResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<IndexSchedulesDataResponse?>? data;

  IndexSchedulesResponse(this.data,);

  //fromJson
  factory IndexSchedulesResponse.fromJson(Map<String, dynamic> json) =>
      _$IndexSchedulesResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$IndexSchedulesResponseToJson(this);
}

//booking create
@JsonSerializable()
class CreateBookingResponse extends BaseResponse {
  CreateBookingResponse();

  //fromJson
  factory CreateBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBookingResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$CreateBookingResponseToJson(this);
}

//booking cancel
@JsonSerializable()
class CancelBookingResponse extends BaseResponse {
  CancelBookingResponse();

  //fromJson
  factory CancelBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelBookingResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$CancelBookingResponseToJson(this);
}

//booking index
@JsonSerializable()
class DoctorResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "birthdate")
  String? birthdate;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "medicine_category")
  String? medicineCategory;
  @JsonKey(name: "week_days")
  String? weekDays;

  DoctorResponse(this.id,
      this.username,
      this.name,
      this.email,
      this.phone,
      this.birthdate,
      this.image,
      this.address,
      this.medicineCategory,
      this.weekDays);

  //fromJson
  factory DoctorResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$DoctorResponseToJson(this);
}

@JsonSerializable()
class BookingDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "date")
  String? date;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "senior")
  UserResponse? senior;
  @JsonKey(name: "doctor")
  DoctorResponse? doctor;

  BookingDataResponse(this.id,
      this.date,
      this.status,
      this.createdAt,
      this.senior,
      this.doctor,);

  //fromJson
  factory BookingDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingDataResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$BookingDataResponseToJson(this);
}

@JsonSerializable()
class IndexBookingResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<BookingDataResponse?>? data;

  IndexBookingResponse(this.data,);

  //fromJson
  factory IndexBookingResponse.fromJson(Map<String, dynamic> json) =>
      _$IndexBookingResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$IndexBookingResponseToJson(this);
}

//history create
@JsonSerializable()
class HistoryCreateDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "history_category_id")
  int? historyCategoryId;

  HistoryCreateDataResponse(this.id,
      this.title,
      this.description,
      this.userId,
      this.historyCategoryId,);

  //fromJson
  factory HistoryCreateDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryCreateDataResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$HistoryCreateDataResponseToJson(this);
}

@JsonSerializable()
class HistoryCreateResponse extends BaseResponse {
  @JsonKey(name: "data")
  HistoryCreateDataResponse? data;

  HistoryCreateResponse(this.data,);

  //fromJson
  factory HistoryCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryCreateResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$HistoryCreateResponseToJson(this);
}

//history update
@JsonSerializable()
class HistoryUpdateResponse extends BaseResponse {
  @JsonKey(name: "data")
  HistoryCreateDataResponse? data;

  HistoryUpdateResponse(this.data,);

  //fromJson
  factory HistoryUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryUpdateResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$HistoryUpdateResponseToJson(this);
}

//history cancel
@JsonSerializable()
class CancelHistoryResponse extends BaseResponse {
  CancelHistoryResponse();

  //fromJson
  factory CancelHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelHistoryResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$CancelHistoryResponseToJson(this);
}

//history index
@JsonSerializable()
class HistoryIndexResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<HistoryCreateDataResponse?>? data;

  HistoryIndexResponse(this.data,);

  //fromJson
  factory HistoryIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryIndexResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$HistoryIndexResponseToJson(this);
}

//historyCategories create
@JsonSerializable()
class HistoryCategoriesCreateDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "user_id")
  int? userId;

  HistoryCategoriesCreateDataResponse(this.id,
      this.title,
      this.description,
      this.userId,);

  //fromJson
  factory HistoryCategoriesCreateDataResponse.fromJson(
      Map<String, dynamic> json) =>
      _$HistoryCategoriesCreateDataResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() =>
      _$HistoryCategoriesCreateDataResponseToJson(this);
}

@JsonSerializable()
class HistoryCategoriesCreateResponse extends BaseResponse {
  @JsonKey(name: "data")
  HistoryCategoriesCreateDataResponse? data;

  HistoryCategoriesCreateResponse(this.data,);

  //fromJson
  factory HistoryCategoriesCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryCategoriesCreateResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() =>
      _$HistoryCategoriesCreateResponseToJson(this);
}

//historyCategories update
@JsonSerializable()
class HistoryCategoriesUpdateResponse extends BaseResponse {
  @JsonKey(name: "data")
  HistoryCategoriesCreateDataResponse? data;

  HistoryCategoriesUpdateResponse(this.data,);

  //fromJson
  factory HistoryCategoriesUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryCategoriesUpdateResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() =>
      _$HistoryCategoriesUpdateResponseToJson(this);
}

//historyCategories cancel
@JsonSerializable()
class CancelHistoryCategoriesResponse extends BaseResponse {
  CancelHistoryCategoriesResponse();

  //fromJson
  factory CancelHistoryCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelHistoryCategoriesResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() =>
      _$CancelHistoryCategoriesResponseToJson(this);
}

//historyCategories index
@JsonSerializable()
class HistoryCategoriesIndexResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<HistoryCategoriesCreateDataResponse?>? data;

  HistoryCategoriesIndexResponse(this.data,);

  //fromJson
  factory HistoryCategoriesIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$HistoryCategoriesIndexResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$HistoryCategoriesIndexResponseToJson(this);
}

//medications create
@JsonSerializable()
class MedicationsCreateDataResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "medication")
  String? medication;
  @JsonKey(name: "medication_dose")
  int? medicationDose;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "created_at")
  String? createdAt;

  MedicationsCreateDataResponse(this.id,
      this.userId,
      this.medication,
      this.medicationDose,
      this.description,
      this.createdAt,);

  //fromJson
  factory MedicationsCreateDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicationsCreateDataResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$MedicationsCreateDataResponseToJson(this);
}

@JsonSerializable()
class MedicationsCreateResponse extends BaseResponse {
  @JsonKey(name: "data")
  MedicationsCreateDataResponse? data;

  MedicationsCreateResponse(this.data,);

  //fromJson
  factory MedicationsCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicationsCreateResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$MedicationsCreateResponseToJson(this);
}

//medications update
@JsonSerializable()
class MedicationsUpdateResponse extends BaseResponse {
  MedicationsUpdateResponse();

  //fromJson
  factory MedicationsUpdateResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicationsUpdateResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$MedicationsUpdateResponseToJson(this);
}

//medications cancel
@JsonSerializable()
class CancelMedicationsResponse extends BaseResponse {
  CancelMedicationsResponse();

  //fromJson
  factory CancelMedicationsResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelMedicationsResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$CancelMedicationsResponseToJson(this);
}

//medications index
@JsonSerializable()
class MedicationsIndexResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<MedicationsCreateDataResponse?>? data;

  MedicationsIndexResponse(this.data,);

  //fromJson
  factory MedicationsIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicationsIndexResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$MedicationsIndexResponseToJson(this);
}


//medications code create
@JsonSerializable()
class MedicationsCodeCreateDataResponse {
  @JsonKey(name: "data")
  int? data;


  MedicationsCodeCreateDataResponse(this.data);
  //fromJson
  factory MedicationsCodeCreateDataResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicationsCodeCreateDataResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$MedicationsCodeCreateDataResponseToJson(this);
}

@JsonSerializable()
class MedicationsCodeCreateResponse extends BaseResponse {
  @JsonKey(name: "data")
  MedicationsCodeCreateDataResponse? data;

  MedicationsCodeCreateResponse(this.data,);

  //fromJson
  factory MedicationsCodeCreateResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicationsCodeCreateResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$MedicationsCodeCreateResponseToJson(this);
}

//medications code index
@JsonSerializable()
class MedicationsCodeIndexResponse extends BaseResponse {
  @JsonKey(name: "data")
  String? data;

  MedicationsCodeIndexResponse(this.data,);

  //fromJson
  factory MedicationsCodeIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$MedicationsCodeIndexResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$MedicationsCodeIndexResponseToJson(this);
}


//doctor index
@JsonSerializable()
class DoctorIndexResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<UserResponse?>? data;

  DoctorIndexResponse(this.data,);

  //fromJson
  factory DoctorIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$DoctorIndexResponseFromJson(json);

  //toJson
  Map<String, dynamic> toJson() => _$DoctorIndexResponseToJson(this);
}