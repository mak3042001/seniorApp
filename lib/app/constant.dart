import 'package:senior/app/app_preference.dart';
import 'package:senior/data/repository/data_repository.dart';

class Constant {
  final AppPreference _appPreference;

  Constant(this._appPreference);

  static const String baseUrl = "https://test.ahmed.center/final_project/public";
  static String empty = "";
  static int userId = RepositoryImpl.id;
  static int zero = 0;
  static Duration timeOut = const Duration(milliseconds: 60000);
}