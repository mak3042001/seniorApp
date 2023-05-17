import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezeClasses.freezed.dart';

@freezed
class LoginObject with _$LoginObject{
  factory LoginObject(String email,String password) = _Loginobject;
}