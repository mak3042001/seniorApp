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
