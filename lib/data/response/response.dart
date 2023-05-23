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

  DataResponse(
    this.user,
    this.token,
  );

  //fromJson
  factory DataResponse.fromJson(Map<String,dynamic> json ) => _$DataResponseFromJson(json);

  //toJson
  Map<String,dynamic> toJson() => _$DataResponseToJson(this);
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

  UserResponse(
    this.id,
    this.username,
    this.name,
    this.email,
    this.phone,
    this.birthdate,
    this.age,
    this.image,
  );

  //fromJson
  factory UserResponse.fromJson(Map<String,dynamic> json ) => _$UserResponseFromJson(json);

  //toJson
  Map<String,dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class AuthResponse extends BaseResponse {
  @JsonKey(name: "data")
  DataResponse? data;

  AuthResponse(
    this.data,
  );

  //fromJson
  factory AuthResponse.fromJson(Map<String,dynamic> json ) => _$AuthResponseFromJson(json);

  //toJson
  Map<String,dynamic> toJson() => _$AuthResponseToJson(this);
}

//schedules create
@JsonSerializable()
class CreateSchedulesResponse extends BaseResponse {

  CreateSchedulesResponse();

  //fromJson
  factory CreateSchedulesResponse.fromJson(Map<String,dynamic> json ) => _$CreateSchedulesResponseFromJson(json);

  //toJson
  Map<String,dynamic> toJson() => _$CreateSchedulesResponseToJson(this);
}

//schedules cancel
@JsonSerializable()
class CancelSchedulesResponse extends BaseResponse {

  CancelSchedulesResponse();

  //fromJson
  factory CancelSchedulesResponse.fromJson(Map<String,dynamic> json ) => _$CancelSchedulesResponseFromJson(json);

  //toJson
  Map<String,dynamic> toJson() => _$CancelSchedulesResponseToJson(this);
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
  int? createdAt;

  IndexSchedulesDataResponse(
      this.id,
      this.title,
      this.description,
      this.date,
      this.time,
      this.type,
      this.createdAt,
      );

  //fromJson
  factory IndexSchedulesDataResponse.fromJson(Map<String,dynamic> json ) => _$IndexSchedulesDataResponseFromJson(json);

  //toJson
  Map<String,dynamic> toJson() => _$IndexSchedulesDataResponseToJson(this);
}

@JsonSerializable()
class IndexSchedulesResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<IndexSchedulesResponse?>? data;

  IndexSchedulesResponse(
      this.data,
      );

  //fromJson
  factory IndexSchedulesResponse.fromJson(Map<String,dynamic> json ) => _$IndexSchedulesResponseFromJson(json);

  //toJson
  Map<String,dynamic> toJson() => _$IndexSchedulesResponseToJson(this);
}

//booking create
@JsonSerializable()
class CreateBookingResponse extends BaseResponse {

  CreateBookingResponse();

  //fromJson
  factory CreateBookingResponse.fromJson(Map<String,dynamic> json ) => _$CreateBookingResponseFromJson(json);

  //toJson
  Map<String,dynamic> toJson() => _$CreateBookingResponseToJson(this);
}

//booking cancel
@JsonSerializable()
class CancelBookingResponse extends BaseResponse {

  CancelBookingResponse();

  //fromJson
  factory CancelBookingResponse.fromJson(Map<String,dynamic> json ) => _$CancelBookingResponseFromJson(json);

  //toJson
  Map<String,dynamic> toJson() => _$CancelBookingResponseToJson(this);
}