import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezeClasses.freezed.dart';

@freezed
class LoginObject with _$Loginobject{
  factory LoginObject(String email,String password) = _Loginobject;
}