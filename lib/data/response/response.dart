import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "successful")
  bool? successful;
  @JsonKey(name: "message")
  String? message;
}

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
