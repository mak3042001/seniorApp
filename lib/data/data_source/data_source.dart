import 'dart:io';

import 'package:senior/app/app_preference.dart';
import 'package:senior/data/network/app_api.dart';
import 'package:senior/data/network/request.dart';
import 'package:senior/data/response/response.dart';

abstract class RemoteDataSource {
  Future<MessageUseResponse> message();
  
  Future<UserUseResponse> user();

  Future<AuthResponse> login(LoginRequest loginRequest);

  Future<AuthResponse> register(RegisterRequest registerRequest);

  Future<AuthResponse> updateProfile(UpdateProfileRequest updateProfileRequest);

  Future<ChangeImageResponse> changeImage(
      ChangeImageRequest changeImageRequest);

  Future<ChangePasswordResponse> changePassword(
      ChangePasswordRequest changePasswordRequest);

  Future<ProfileResponse> profileIndex();

  Future<NotificationDataIndexResponse> notificationIndex();

  Future<CreateSchedulesResponse> schedulesCreate(
      SchedulesCreateRequest schedulesCreateRequest);

  Future<CancelSchedulesResponse> schedulesCancel(
      SchedulesCancelRequest schedulesCancelRequest);

  Future<IndexSchedulesResponse> schedulesIndex();

  Future<CreateBookingResponse> bookingCreate(
      BookingCreateRequest bookingCreateRequest);

  Future<CancelBookingResponse> bookingCancel(
      BookingCancelRequest bookingCancelRequest);

  Future<IndexBookingResponse> bookingsIndex();

  Future<HistoryCreateResponse> historyCreate(
      HistoryCreateRequest historyCreateRequest);

  Future<CancelHistoryResponse> historyCancel(
      HistoryCancelRequest historyCancelRequest);

  Future<HistoryUpdateResponse> historyUpdate(
      HistoryUpdateRequest historyUpdateRequest);

  Future<HistoryIndexResponse> historyIndex();

  Future<HistoryCategoriesCreateResponse> historyCategoriesCreate(
      HistoryCategoriesCreateRequest historyCategoriesCreateRequest);

  Future<CancelHistoryCategoriesResponse> historyCategoriesCancel(
      HistoryCategoriesCancelRequest historyCategoriesCancelRequest);

  Future<HistoryCategoriesUpdateResponse> historyCategoriesUpdate(
      HistoryCategoriesUpdateRequest historyCategoriesUpdateRequest);

  Future<HistoryCategoriesIndexResponse> historyCategoriesIndex();

  Future<MedicationsCreateResponse> medicationsCreate(
      MedicationsCreateRequest medicationsCreateRequest);

  Future<CancelMedicationsResponse> medicationsCancel(
      MedicationsCancelRequest medicationsCancelRequest);

  Future<MedicationsUpdateResponse> medicationsUpdate(
      MedicationsUpdateRequest medicationsUpdateRequest);

  Future<MedicationsIndexResponse> medicationsIndex();

  Future<MedicationsCodeCreateResponse> medicationsCodeCreate();

  Future<MedicationsCodeIndexResponse> medicationsCodeIndex();

  Future<DoctorIndexResponse> doctorIndex();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;
  final AppPreference _appPreference;

  RemoteDataSourceImpl(this._appServiceClient, this._appPreference);


  @override
  Future<MessageUseResponse> message() async {
    return await _appServiceClient.message(
      await _appPreference.getUserId(),
    );
  }
  
  
  @override
  Future<UserUseResponse> user() async {
    return await _appServiceClient.user();
  }

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

  @override
  Future<CancelBookingResponse> bookingCancel(
      BookingCancelRequest bookingCancelRequest) async {
    return await _appServiceClient
        .bookingCancel(bookingCancelRequest.bookingId);
  }

  @override
  Future<CreateBookingResponse> bookingCreate(
      BookingCreateRequest bookingCreateRequest) async {
    return await _appServiceClient.bookingCreate(
        bookingCreateRequest.doctorId, bookingCreateRequest.date);
  }

  @override
  Future<IndexBookingResponse> bookingsIndex() async {
    return await _appServiceClient.bookingsIndex();
  }

  @override
  Future<CancelHistoryResponse> historyCancel(
      HistoryCancelRequest historyCancelRequest) async {
    return await _appServiceClient
        .historyCancel(historyCancelRequest.historyId);
  }

  @override
  Future<CancelHistoryCategoriesResponse> historyCategoriesCancel(
      HistoryCategoriesCancelRequest historyCategoriesCancelRequest) async {
    return await _appServiceClient.historyCategoriesCancel(
        historyCategoriesCancelRequest.historyCategoriesId);
  }

  @override
  Future<HistoryCategoriesCreateResponse> historyCategoriesCreate(
      HistoryCategoriesCreateRequest historyCategoriesCreateRequest) async {
    return await _appServiceClient.historyCategoriesCreate(
        historyCategoriesCreateRequest.title,
        historyCategoriesCreateRequest.description);
  }

  @override
  Future<HistoryCategoriesIndexResponse> historyCategoriesIndex() async {
    return await _appServiceClient.historyCategoriesIndex();
  }

  @override
  Future<HistoryCategoriesUpdateResponse> historyCategoriesUpdate(
      HistoryCategoriesUpdateRequest historyCategoriesUpdateRequest) async {
    return await _appServiceClient.historyCategoriesUpdate(
        historyCategoriesUpdateRequest.historyCategoryId,
        historyCategoriesUpdateRequest.title,
        historyCategoriesUpdateRequest.description);
  }

  @override
  Future<HistoryCreateResponse> historyCreate(
      HistoryCreateRequest historyCreateRequest) async {
    return await _appServiceClient.historyCreate(
        historyCreateRequest.historyCategoryId,
        historyCreateRequest.title,
        historyCreateRequest.description);
  }

  @override
  Future<HistoryIndexResponse> historyIndex() async {
    return await _appServiceClient
        .historyIndex(await _appPreference.getHistoryCategoryId());
  }

  @override
  Future<HistoryUpdateResponse> historyUpdate(
      HistoryUpdateRequest historyUpdateRequest) async {
    return await _appServiceClient.historyUpdate(
        historyUpdateRequest.historyCategoryId,
        historyUpdateRequest.title,
        historyUpdateRequest.description);
  }

  @override
  Future<CancelMedicationsResponse> medicationsCancel(
      MedicationsCancelRequest medicationsCancelRequest) async {
    return await _appServiceClient
        .medicationsCancel(medicationsCancelRequest.medicationId);
  }

  @override
  Future<MedicationsCreateResponse> medicationsCreate(
      MedicationsCreateRequest medicationsCreateRequest) async {
    return await _appServiceClient.medicationsCreate(
        medicationsCreateRequest.medication,
        medicationsCreateRequest.medicationDose);
  }

  @override
  Future<MedicationsIndexResponse> medicationsIndex() async {
    return await _appServiceClient.medicationsIndex();
  }

  @override
  Future<MedicationsUpdateResponse> medicationsUpdate(
      MedicationsUpdateRequest medicationsUpdateRequest) async {
    return await _appServiceClient.medicationsUpdate(
        medicationsUpdateRequest.medicationId,
        medicationsUpdateRequest.medication,
        medicationsUpdateRequest.medicationDose);
  }

  @override
  Future<CancelSchedulesResponse> schedulesCancel(
      SchedulesCancelRequest schedulesCancelRequest) async {
    return await _appServiceClient
        .schedulesCancel(schedulesCancelRequest.scheduleId);
  }

  @override
  Future<CreateSchedulesResponse> schedulesCreate(
      SchedulesCreateRequest schedulesCreateRequest) async {
    return await _appServiceClient.schedulesCreate(
      schedulesCreateRequest.title,
      schedulesCreateRequest.date,
      schedulesCreateRequest.time,
      schedulesCreateRequest.type,
      schedulesCreateRequest.description,
    );
  }

  @override
  Future<IndexSchedulesResponse> schedulesIndex() async {
    return await _appServiceClient.schedulesIndex(
      await _appPreference.getUserId(),
    );
  }

  @override
  Future<ChangeImageResponse> changeImage(
      ChangeImageRequest changeImageRequest) async {
    File file = File(changeImageRequest.image);
    String fileName = file.path.split('/').last;
    print("hello image  $fileName");
    return await _appServiceClient.changeImage(
        File(fileName),
    );
  }

  @override
  Future<NotificationDataIndexResponse> notificationIndex() async {
    return await _appServiceClient.notificationIndex();
  }

  @override
  Future<ProfileResponse> profileIndex() async {
    return await _appServiceClient.showProfile();
  }

  @override
  Future<AuthResponse> updateProfile(
      UpdateProfileRequest updateProfileRequest) async {
    return await _appServiceClient.updateProfile(
      updateProfileRequest.name,
      updateProfileRequest.username,
      updateProfileRequest.phone,
      updateProfileRequest.birthdate,
    );
  }

  @override
  Future<MedicationsCodeCreateResponse> medicationsCodeCreate() async {
    return await _appServiceClient.medicationsCodeCreate();
  }

  @override
  Future<MedicationsCodeIndexResponse> medicationsCodeIndex() async {
    return await _appServiceClient.medicationsCodeIndex();
  }

  @override
  Future<DoctorIndexResponse> doctorIndex() async {
    return await _appServiceClient.doctorIndex();
  }

  @override
  Future<ChangePasswordResponse> changePassword(
      ChangePasswordRequest changePasswordRequest) async {
    return await _appServiceClient.changePassword(
        changePasswordRequest.currentPassword,
        changePasswordRequest.password,
        changePasswordRequest.confirmPassword);
  }
}
