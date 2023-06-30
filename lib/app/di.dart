import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:senior/app/app_preference.dart';
import 'package:senior/data/network/app_api.dart';
import 'package:senior/data/repository/data_repository.dart';
import 'package:senior/domain/repository/domain_repository.dart';
import 'package:senior/domain/usecase/auth/login_usecase.dart';
import 'package:senior/domain/usecase/auth/profile_index_usecase.dart';
import 'package:senior/domain/usecase/auth/update_usecase.dart';
import 'package:senior/domain/usecase/booking/booking_cancel_usecase.dart';
import 'package:senior/domain/usecase/booking/booking_create_usecase.dart';
import 'package:senior/domain/usecase/booking/booking_index_usecase.dart';
import 'package:senior/domain/usecase/doctor/doctor_index_usecase.dart';
import 'package:senior/domain/usecase/history_categories/historyCategories_cancel_usecase.dart';
import 'package:senior/domain/usecase/history_categories/historyCategories_create_usecase.dart';
import 'package:senior/domain/usecase/history_categories/historyCategories_index_usecase.dart';
import 'package:senior/domain/usecase/history_categories/historyCategories_update_usecase.dart';
import 'package:senior/domain/usecase/medication/medication_create_usecase.dart';
import 'package:senior/domain/usecase/medication/medication_index_usecase.dart';
import 'package:senior/domain/usecase/medication_code/medication_code_create_usecase.dart';
import 'package:senior/domain/usecase/medication_code/medication_code_index_usecase.dart';
import 'package:senior/domain/usecase/schedules/schedules_cancel_usecase.dart';
import 'package:senior/presentation/appointment/appointment_viewModel/appointment_viewModel.dart';
import 'package:senior/presentation/booking/booking_viewModel/booking_view_model.dart';
import 'package:senior/presentation/history_category/history_category_viewModel/history_category_viewModel.dart';
import 'package:senior/presentation/medications/medication_viewModel/medication_viewModel.dart';
import 'package:senior/presentation/medications_code/medication_code_viewModel/medication_code_viewModel.dart';
import 'package:senior/presentation/profile/profile_viewModel/profile_viewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/data_source/data_source.dart';
import '../data/network/dio_factory.dart';
import '../data/network/network_info.dart';
import '../domain/usecase/auth/change_image_usecase.dart';
import '../domain/usecase/auth/change_password_usecase.dart';
import '../domain/usecase/auth/register_usecase.dart';
import '../domain/usecase/auth/user.dart';
import '../domain/usecase/history/history_cancel_usecase.dart';
import '../domain/usecase/history/history_create_usecase.dart';
import '../domain/usecase/history/history_index_usecase.dart';
import '../domain/usecase/history/history_update_usecase.dart';
import '../domain/usecase/medication/medication_cancel_usecase.dart';
import '../domain/usecase/medication/medication_update_usecase.dart';
import '../domain/usecase/notification/notification_usecase.dart';
import '../domain/usecase/schedules/schedules_create_usecase.dart';
import '../domain/usecase/schedules/schedules_index_usecase.dart';
import '../presentation/history/history_viewModel/history_viewModel.dart';
import '../presentation/login/login_view_model/login_viewModel.dart';
import '../presentation/notification/notification_viewModel/notification_viewModel.dart';
import '../presentation/schedules/schedules_viewModel/schedules_viewModel.dart';
import '../presentation/sign up/signup_view_model/signup_view_model.dart';
import '../presentation/users/user_viewModel/user_viewModel.dart';

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
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  Dio dio = await instance<DioFactory>().getDio();
  //app service client
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl(instance<AppServiceClient>() , instance<AppPreference>()));

  // repository

  instance.registerLazySingleton<Repository>(
          () => RepositoryImpl(instance(), instance(),instance()));

  instance.registerFactory<ImagePicker>(() => ImagePicker());

  initSchedulesIndexModule();
  initNotificationModule();
  initHistoryCategoriesModule();
  initAppointmentModule();
  initBookingModule();
  initCodeModule();
  initHistoryModule();
  initMedicationsModule();
  initProfileModule();
  initUserModule();
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
    instance.registerFactory<SchedulesCancelUseCase>(
            () => SchedulesCancelUseCase(instance()));
    instance.registerFactory<SchedulesViewModel>(
            () => SchedulesViewModel(instance(),instance(),instance()));
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

initUserModule() {
  if (!GetIt.I.isRegistered<UserUseCase>()) {
    instance.registerFactory<UserUseCase>(
            () => UserUseCase(instance()));
    instance.registerFactory<UserViewModel>(
            () => UserViewModel(instance()));
  }
}

  initHistoryCategoriesModule() {
    if (!GetIt.I.isRegistered<HistoryCategoriesIndexUseCase>()) {
      instance.registerFactory<HistoryCategoriesIndexUseCase>(
              () => HistoryCategoriesIndexUseCase(instance()));
      instance.registerFactory<HistoryCategoriesCreateUseCase>(
              () => HistoryCategoriesCreateUseCase(instance()));
      instance.registerFactory<HistoryCategoriesCancelUseCase>(
              () => HistoryCategoriesCancelUseCase(instance()));
      instance.registerFactory<HistoryCategoriesUpdateUseCase>(
              () => HistoryCategoriesUpdateUseCase(instance()));
      instance.registerFactory<HistoryCategoriesViewModel>(
              () => HistoryCategoriesViewModel(instance(),instance(),instance(), instance()));
    }
  }

initHistoryModule() {
  if (!GetIt.I.isRegistered<HistoryIndexUseCase>()) {
    instance.registerFactory<HistoryIndexUseCase>(
            () => HistoryIndexUseCase(instance()));
    instance.registerFactory<HistoryCreateUseCase>(
            () => HistoryCreateUseCase(instance()));
    instance.registerFactory<HistoryCancelUseCase>(
            () => HistoryCancelUseCase(instance()));
    instance.registerFactory<HistoryUpdateUseCase>(
            () => HistoryUpdateUseCase(instance()));
    instance.registerFactory<HistoryViewModel>(
            () => HistoryViewModel(instance(),instance(),instance(), instance()));
  }
}

initMedicationsModule() {
  if (!GetIt.I.isRegistered<MedicationIndexUseCase>()) {
    instance.registerFactory<MedicationIndexUseCase>(
            () => MedicationIndexUseCase(instance()));
    instance.registerFactory<MedicationCreateUseCase>(
            () => MedicationCreateUseCase(instance()));
    instance.registerFactory<MedicationCancelUseCase>(
            () => MedicationCancelUseCase(instance()));
    instance.registerFactory<MedicationUpdateUseCase>(
            () => MedicationUpdateUseCase(instance()));
    instance.registerFactory<MedicationsViewModel>(
            () => MedicationsViewModel(instance(),instance(),instance(), instance()));
  }
}

  initAppointmentModule() {
    if (!GetIt.I.isRegistered<BookingIndexUseCase>()) {
      instance.registerFactory<BookingIndexUseCase>(
              () => BookingIndexUseCase(instance(),));
      instance.registerFactory<BookingCancelUseCase>(
              () => BookingCancelUseCase(instance(),));
      instance.registerFactory<AppointmentViewModel>(
              () => AppointmentViewModel(instance(),instance()));
    }
  }

  initBookingModule() {
    if (!GetIt.I.isRegistered<BookingCreateUseCase>()) {
      instance.registerFactory<BookingCreateUseCase>(
              () => BookingCreateUseCase(instance(),));
      instance.registerFactory<DoctorIndexUseCase>(
              () => DoctorIndexUseCase(instance(),));
      instance.registerFactory<BookingModel>(
              () => BookingModel(instance(),instance()));
    }
  }

initCodeModule() {
  if (!GetIt.I.isRegistered<MedicationsCodeIndexUseCase>()) {
    instance.registerFactory<MedicationsCodeIndexUseCase>(
            () => MedicationsCodeIndexUseCase(instance(),));
    instance.registerFactory<MedicationsCodeCreateUseCase>(
            () => MedicationsCodeCreateUseCase(instance(),));
    instance.registerFactory<MedicationsCodeViewModel>(
            () => MedicationsCodeViewModel(instance(),instance()));
  }
}

initProfileModule() {
  if (!GetIt.I.isRegistered<ProfileIndexUseCase>()) {
    instance.registerFactory<ProfileIndexUseCase>(
            () => ProfileIndexUseCase(instance(),));
    instance.registerFactory<UpdateUseCase>(
            () => UpdateUseCase(instance(),));
    instance.registerFactory<ChangePasswordUseCase>(
            () => ChangePasswordUseCase(instance(),));
    instance.registerFactory<ChangeImageUseCase>(
            () => ChangeImageUseCase(instance(),));
    instance.registerFactory<ProfileViewModel>(
            () => ProfileViewModel(instance(),instance(),instance(), instance()));
  }
}