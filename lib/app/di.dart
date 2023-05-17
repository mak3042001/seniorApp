import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:senior/app/app_preference.dart';
import 'package:senior/data/data_source/data_source.dart';
import 'package:senior/data/network/app_api.dart';
import 'package:senior/data/network/dio_factory.dart';
import 'package:senior/data/network/network_info.dart';
import 'package:senior/domain/usecase/login_usecase.dart';
import 'package:senior/domain/usecase/register_usecase.dart';
import 'package:senior/presentation/login/login_view_model/login_viewModel.dart';
import 'package:senior/presentation/sign%20up/signup_view_model/signup_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/data_repository.dart';
import '../domain/repository/domain_repository.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  //shared prefs
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  //app prefs
  instance.registerLazySingleton<AppPreference>(() => AppPreference(instance()));

  //dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();

  //app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //internet connection checker
  instance.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());

  //network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(instance()));

  //data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(instance()));

  //repository
  instance.registerLazySingleton<Repository>(() => DataRepository(instance(),instance()));

}

Future<void> initLoginModule() async {
  if(!GetIt.I.isRegistered<LoginUseCase>()){
  //login usecase
  instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));

  //view model
  instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

Future<void> initRegisterModule() async {
  if(!GetIt.I.isRegistered<RegisterUseCase>()){
  //login usecase
  instance.registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));

  //view model
  instance.registerFactory<RegisterViewModel>(() => RegisterViewModel(instance()));
  }
}