import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:senior/app/constant.dart';
import 'package:senior/data/response/response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/api/seniors/login")
  Future<AuthResponse> login(
    @Field("username") String username,
    @Field("password") String password,
  );

  @POST("/api/seniors/register")
  Future<AuthResponse> register(
    @Field("username") String username,
    @Field("name") String name,
    @Field("phone") String phone,
    @Field("birthdate") String birthdate,
    @Field("password") String password,
    @Field("confirm_password") String confirmPassword,
  );
}
