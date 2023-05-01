import 'package:senior/app/constant.dart';
import 'package:senior/app/extension.dart';
import 'package:senior/data/response/response.dart';
import 'package:senior/domain/model/model.dart';

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