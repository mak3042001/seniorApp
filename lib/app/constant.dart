import 'package:senior/data/repository/data_repository.dart';

class Constant{
  static const String baseUrl = "https://test.ahmed.center/final_project/public";
  static String empty = "";
  static String token = RepositoryImpl.token;
  static int historyCategoryId = RepositoryImpl.historyCategoryId;
  static String bookingDate = RepositoryImpl.bookingDate;
  static int id = RepositoryImpl.id;
  static int zero = 0;
  static Duration timeOut = const Duration(milliseconds: 60000);
}