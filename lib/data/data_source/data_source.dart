import 'package:senior/data/network/app_api.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/data/response/response.dart';

abstract class RemoteDataSource {
  Future<AuthResponse> login(LoginRequest loginRequest);
  Future<AuthResponse> register(RegisterRequest registerRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
      loginRequest.username,
      loginRequest.password,
    );
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
      registerRequest.username,
      registerRequest.name,
      registerRequest.phone,
      registerRequest.birthdate,
      registerRequest.password,
      registerRequest.confirmPassword,
    );
  }
}
