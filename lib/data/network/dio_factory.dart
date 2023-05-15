import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:senior/app/app_preference.dart';
import 'package:senior/app/constant.dart';


const String applicationJson = "application/json";
const String contactType = "contact-type";
const String accept = "accept";
const String authorization = "authorization";
const String defaultLanguage = "language";

class DioFactory {
  final AppPreference _appPreference;

  DioFactory(this._appPreference);

  Future<Dio> getDio() async {
    Dio dio = Dio();

    String language = await _appPreference.getLanguage();

    Map<String, String> headers = {
      contactType: applicationJson,
      accept: applicationJson,
      authorization: Constant.token,
      defaultLanguage: language,
    };

    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      headers: headers,
      receiveTimeout: Constant.timeOut,
      sendTimeout: Constant.timeOut,
    );

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    return dio;
  }
}
