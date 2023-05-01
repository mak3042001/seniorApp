import 'package:senior/data/network/app_api.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/data/response/response.dart';

abstract class DataSource {
  Future<AuthResponse> login(LoginRequest loginRequest);
}

class DataSourceImpl implements DataSource {
  final AppServiceClient _appServiceClient;

  DataSourceImpl(this._appServiceClient);

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) {
    return _appServiceClient.login(
      loginRequest.username,
      loginRequest.password,
    );
  }
}
