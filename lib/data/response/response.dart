import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BaseResponse{
  @JsonKey(name : "status")
  int? status;
  @JsonKey(name : "message")
  String? message;
}

@JsonSerializable()
class DataResponse{
  @JsonKey(name : "user")
  UserResponse? user;
  @JsonKey(name : "token")
  String? token;
}

@JsonSerializable()
class UserResponse{
  @JsonKey(name : "id")
  int? id;
  @JsonKey(name : "username")
  String? username;
  @JsonKey(name : "name")
  String? name;
  @JsonKey(name : "email")
  String? email;
  @JsonKey(name : "phone")
  String? phone;
  @JsonKey(name : "birthdate")
  String? birthdate;
  @JsonKey(name : "age")
  int? age;
  @JsonKey(name : "image")
  String? image;
}

@JsonSerializable()
class AuthResponse extends BaseResponse{
  @JsonKey(name : "data")
  DataResponse? data;
}

