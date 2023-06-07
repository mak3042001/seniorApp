

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:senior/app/app_preference.dart';
import 'package:senior/data/network/app_api.dart';
import 'package:senior/data/repository/data_repository.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/login_usecase.dart';
import 'package:senior/domain/usecase/booking/booking_index_usecase.dart';
import 'package:senior/domain/usecase/history_categories/historyCategories_index_usecase.dart';
import 'package:senior/domain/usecase/medication/medication_index_usecase.dart';
import 'package:senior/presentation/appointment/appointment_viewModel/appointment_viewModel.dart';
import 'package:senior/presentation/history_category/history_category_viewModel/history_category_viewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/data_source.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../domain/usecase/auth/register_usecase.dart';
import '../domain/usecase/notification/notification_usecase.dart';
import '../domain/usecase/schedules/schedules_create_usecase.dart';
import '../domain/usecase/schedules/schedules_index_usecase.dart';
import '../presentation/login/login_view_model/login_viewModel.dart';
import '../presentation/notification/notification_viewModel/notification_viewModel.dart';
import '../presentation/schedules/schedules_viewModel/schedules_viewModel.dart';
import '../presentation/sign up/signup_view_model/signup_view_model.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  // shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreference>(() => AppPreference(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl(instance<AppServiceClient>() , instance<AppPreference>()));

  // repository

  instance.registerLazySingleton<Repository>(
          () => RepositoryImpl(instance(), instance(),instance()));

  initSchedulesIndexModule();
  initNotificationModule();
  initHistoryCategoriesModule();
  initAppointmentModule();
}

//auth
initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance
        .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(
            () => RegisterViewModel(instance()));
  }
}
//schedule
initSchedulesIndexModule() {
  if (!GetIt.I.isRegistered<SchedulesIndexUseCase>()) {
    instance.registerFactory<SchedulesCreateUseCase>(
            () => SchedulesCreateUseCase(instance()));
    instance.registerFactory<SchedulesIndexUseCase>(
            () => SchedulesIndexUseCase(instance()));
    instance.registerFactory<SchedulesViewModel>(
            () => SchedulesViewModel(instance(),instance()));
  }
}

initNotificationModule() {
  if (!GetIt.I.isRegistered<NotificationUseCase>()) {
    instance.registerFactory<NotificationUseCase>(
            () => NotificationUseCase(instance()));
    instance.registerFactory<NotificationViewModel>(
            () => NotificationViewModel(instance()));
  }
}

  initHistoryCategoriesModule() {
    if (!GetIt.I.isRegistered<HistoryCategoriesIndexUseCase>()) {
      instance.registerFactory<HistoryCategoriesIndexUseCase>(
              () => HistoryCategoriesIndexUseCase(instance()));
      instance.registerFactory<HistoryCategoriesViewModel>(
              () => HistoryCategoriesViewModel(instance()));
    }
  }

  initAppointmentModule() {
    if (!GetIt.I.isRegistered<BookingIndexUseCase>()) {
      instance.registerFactory<BookingIndexUseCase>(
              () => BookingIndexUseCase(instance(),));
      instance.registerFactory<AppointmentViewModel>(
              () => AppointmentViewModel(instance()));
    }
  }