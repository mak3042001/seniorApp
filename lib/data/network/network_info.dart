import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get connection;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;

  NetworkInfoImpl(
    this._internetConnectionChecker,
  );

  @override
  Future<bool> get connection => _internetConnectionChecker.hasConnection;
}
