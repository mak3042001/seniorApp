// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicationDataResponse _$MedicationDataResponseFromJson(
        Map<String, dynamic> json) =>
    MedicationDataResponse(
      json['id'] as int?,
      json['senior_id'] as String?,
      json['medication'] as String?,
      json['medication_dose'] as int?,
      json['description'] as String?,
      json['created_at'] as String?,
    );

Map<String, dynamic> _$MedicationDataResponseToJson(
        MedicationDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senior_id': instance.seniorId,
      'medication': instance.medication,
      'medication_dose': instance.medicationDose,
      'description': instance.description,
      'created_at': instance.createdAt,
    };

MedicationUseResponse _$MedicationUseResponseFromJson(
        Map<String, dynamic> json) =>
    MedicationUseResponse(
      json['data'] == null
          ? null
          : MedicationDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MedicationUseResponseToJson(
        MedicationUseResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

MessageDataResponse _$MessageDataResponseFromJson(Map<String, dynamic> json) =>
    MessageDataResponse(
      json['id'] as int?,
      json['username'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['birthdate'] as String?,
      json['age'] as int?,
      json['image'] as String?,
      json['type'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$MessageDataResponseToJson(
        MessageDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'birthdate': instance.birthdate,
      'age': instance.age,
      'image': instance.image,
      'type': instance.type,
      'message': instance.message,
    };

MessageUseResponse _$MessageUseResponseFromJson(Map<String, dynamic> json) =>
    MessageUseResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MessageDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MessageUseResponseToJson(MessageUseResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

UserDataResponse _$UserDataResponseFromJson(Map<String, dynamic> json) =>
    UserDataResponse(
      json['id'] as int?,
      json['username'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['birthdate'] as String?,
      json['age'] as int?,
      json['image'] as String?,
      json['type'] as String?,
    );

Map<String, dynamic> _$UserDataResponseToJson(UserDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'birthdate': instance.birthdate,
      'age': instance.age,
      'image': instance.image,
      'type': instance.type,
    };

UserUseResponse _$UserUseResponseFromJson(Map<String, dynamic> json) =>
    UserUseResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : UserDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$UserUseResponseToJson(UserUseResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..successful = json['successful'] as bool?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
    };

ProfileDataResponse _$ProfileDataResponseFromJson(Map<String, dynamic> json) =>
    ProfileDataResponse(
      json['id'] as int?,
      json['username'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['birthdate'] as String?,
      json['age'] as int?,
      json['image'] as String?,
    );

Map<String, dynamic> _$ProfileDataResponseToJson(
        ProfileDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'birthdate': instance.birthdate,
      'age': instance.age,
      'image': instance.image,
    };

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      json['data'] == null
          ? null
          : ProfileDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) => DataResponse(
      json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      json['token'] as String?,
    );

Map<String, dynamic> _$DataResponseToJson(DataResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['id'] as int?,
      json['username'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['birthdate'] as String?,
      json['age'] as int?,
      json['image'] as String?,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'birthdate': instance.birthdate,
      'age': instance.age,
      'image': instance.image,
    };

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      json['data'] == null
          ? null
          : DataResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

ChangeImageResponse _$ChangeImageResponseFromJson(Map<String, dynamic> json) =>
    ChangeImageResponse()
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ChangeImageResponseToJson(
        ChangeImageResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
    };

ChangePasswordResponse _$ChangePasswordResponseFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordResponse()
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$ChangePasswordResponseToJson(
        ChangePasswordResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
    };

AuthLogOutResponse _$AuthLogOutResponseFromJson(Map<String, dynamic> json) =>
    AuthLogOutResponse()
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthLogOutResponseToJson(AuthLogOutResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
    };

NotificationDataResponse _$NotificationDataResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationDataResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['content'] as String?,
      json['seen'] as String?,
      json['created_at'] as String?,
    );

Map<String, dynamic> _$NotificationDataResponseToJson(
        NotificationDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'seen': instance.seen,
      'created_at': instance.createdAt,
    };

NotificationDataIndexResponse _$NotificationDataIndexResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationDataIndexResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NotificationDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$NotificationDataIndexResponseToJson(
        NotificationDataIndexResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

CreateSchedulesResponse _$CreateSchedulesResponseFromJson(
        Map<String, dynamic> json) =>
    CreateSchedulesResponse()
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CreateSchedulesResponseToJson(
        CreateSchedulesResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
    };

CancelSchedulesResponse _$CancelSchedulesResponseFromJson(
        Map<String, dynamic> json) =>
    CancelSchedulesResponse()
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CancelSchedulesResponseToJson(
        CancelSchedulesResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
    };

IndexSchedulesDataResponse _$IndexSchedulesDataResponseFromJson(
        Map<String, dynamic> json) =>
    IndexSchedulesDataResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['description'] as String?,
      json['date'] as String?,
      json['time'] as String?,
      json['type'] as String?,
      json['created_at'] as String?,
    );

Map<String, dynamic> _$IndexSchedulesDataResponseToJson(
        IndexSchedulesDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date,
      'time': instance.time,
      'type': instance.type,
      'created_at': instance.createdAt,
    };

IndexSchedulesResponse _$IndexSchedulesResponseFromJson(
        Map<String, dynamic> json) =>
    IndexSchedulesResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : IndexSchedulesDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$IndexSchedulesResponseToJson(
        IndexSchedulesResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

CreateBookingResponse _$CreateBookingResponseFromJson(
        Map<String, dynamic> json) =>
    CreateBookingResponse()
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CreateBookingResponseToJson(
        CreateBookingResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
    };

CancelBookingResponse _$CancelBookingResponseFromJson(
        Map<String, dynamic> json) =>
    CancelBookingResponse()
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CancelBookingResponseToJson(
        CancelBookingResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
    };

DoctorResponse _$DoctorResponseFromJson(Map<String, dynamic> json) =>
    DoctorResponse(
      json['id'] as int?,
      json['username'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['birthdate'] as String?,
      json['image'] as String?,
      json['address'] as String?,
      json['medicine_category'] as String?,
      json['week_days'] as String?,
    );

Map<String, dynamic> _$DoctorResponseToJson(DoctorResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'birthdate': instance.birthdate,
      'image': instance.image,
      'address': instance.address,
      'medicine_category': instance.medicineCategory,
      'week_days': instance.weekDays,
    };

BookingDataResponse _$BookingDataResponseFromJson(Map<String, dynamic> json) =>
    BookingDataResponse(
      json['id'] as int?,
      json['date'] as String?,
      json['status'] as String?,
      json['created_at'] as String?,
      json['senior'] == null
          ? null
          : UserResponse.fromJson(json['senior'] as Map<String, dynamic>),
      json['doctor'] == null
          ? null
          : DoctorResponse.fromJson(json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingDataResponseToJson(
        BookingDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'status': instance.status,
      'created_at': instance.createdAt,
      'senior': instance.senior,
      'doctor': instance.doctor,
    };

IndexBookingResponse _$IndexBookingResponseFromJson(
        Map<String, dynamic> json) =>
    IndexBookingResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : BookingDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$IndexBookingResponseToJson(
        IndexBookingResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

HistoryCreateDataResponse _$HistoryCreateDataResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryCreateDataResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['description'] as String?,
      json['user_id'] as int?,
      json['history_category_id'] as int?,
    );

Map<String, dynamic> _$HistoryCreateDataResponseToJson(
        HistoryCreateDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'user_id': instance.userId,
      'history_category_id': instance.historyCategoryId,
    };

HistoryCreateResponse _$HistoryCreateResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryCreateResponse(
      json['data'] == null
          ? null
          : HistoryCreateDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HistoryCreateResponseToJson(
        HistoryCreateResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

HistoryUpdateResponse _$HistoryUpdateResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryUpdateResponse(
      json['data'] == null
          ? null
          : HistoryCreateDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HistoryUpdateResponseToJson(
        HistoryUpdateResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

CancelHistoryResponse _$CancelHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    CancelHistoryResponse()
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CancelHistoryResponseToJson(
        CancelHistoryResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
    };

HistoryIndexResponse _$HistoryIndexResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryIndexResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : HistoryCreateDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HistoryIndexResponseToJson(
        HistoryIndexResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

HistoryCategoriesCreateDataResponse
    _$HistoryCategoriesCreateDataResponseFromJson(Map<String, dynamic> json) =>
        HistoryCategoriesCreateDataResponse(
          json['id'] as int?,
          json['title'] as String?,
          json['description'] as String?,
          json['user_id'] as int?,
        );

Map<String, dynamic> _$HistoryCategoriesCreateDataResponseToJson(
        HistoryCategoriesCreateDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'user_id': instance.userId,
    };

HistoryCategoriesCreateResponse _$HistoryCategoriesCreateResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryCategoriesCreateResponse(
      json['data'] == null
          ? null
          : HistoryCategoriesCreateDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HistoryCategoriesCreateResponseToJson(
        HistoryCategoriesCreateResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

HistoryCategoriesUpdateResponse _$HistoryCategoriesUpdateResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryCategoriesUpdateResponse(
      json['data'] == null
          ? null
          : HistoryCategoriesCreateDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HistoryCategoriesUpdateResponseToJson(
        HistoryCategoriesUpdateResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

CancelHistoryCategoriesResponse _$CancelHistoryCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    CancelHistoryCategoriesResponse()
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CancelHistoryCategoriesResponseToJson(
        CancelHistoryCategoriesResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
    };

HistoryCategoriesIndexResponse _$HistoryCategoriesIndexResponseFromJson(
        Map<String, dynamic> json) =>
    HistoryCategoriesIndexResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : HistoryCategoriesCreateDataResponse.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HistoryCategoriesIndexResponseToJson(
        HistoryCategoriesIndexResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

MedicationsCreateDataResponse _$MedicationsCreateDataResponseFromJson(
        Map<String, dynamic> json) =>
    MedicationsCreateDataResponse(
      json['id'] as int?,
      json['user_id'] as int?,
      json['medication'] as String?,
      json['medication_dose'] as int?,
      json['description'] as String?,
      json['created_at'] as String?,
    );

Map<String, dynamic> _$MedicationsCreateDataResponseToJson(
        MedicationsCreateDataResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'medication': instance.medication,
      'medication_dose': instance.medicationDose,
      'description': instance.description,
      'created_at': instance.createdAt,
    };

MedicationsCreateResponse _$MedicationsCreateResponseFromJson(
        Map<String, dynamic> json) =>
    MedicationsCreateResponse(
      json['data'] == null
          ? null
          : MedicationsCreateDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MedicationsCreateResponseToJson(
        MedicationsCreateResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

MedicationsUpdateResponse _$MedicationsUpdateResponseFromJson(
        Map<String, dynamic> json) =>
    MedicationsUpdateResponse()
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MedicationsUpdateResponseToJson(
        MedicationsUpdateResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
    };

CancelMedicationsResponse _$CancelMedicationsResponseFromJson(
        Map<String, dynamic> json) =>
    CancelMedicationsResponse()
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$CancelMedicationsResponseToJson(
        CancelMedicationsResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
    };

MedicationsIndexResponse _$MedicationsIndexResponseFromJson(
        Map<String, dynamic> json) =>
    MedicationsIndexResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : MedicationsCreateDataResponse.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MedicationsIndexResponseToJson(
        MedicationsIndexResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

MedicationsCodeCreateDataResponse _$MedicationsCodeCreateDataResponseFromJson(
        Map<String, dynamic> json) =>
    MedicationsCodeCreateDataResponse(
      json['data'] as int?,
    );

Map<String, dynamic> _$MedicationsCodeCreateDataResponseToJson(
        MedicationsCodeCreateDataResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

MedicationsCodeCreateResponse _$MedicationsCodeCreateResponseFromJson(
        Map<String, dynamic> json) =>
    MedicationsCodeCreateResponse(
      json['data'] == null
          ? null
          : MedicationsCodeCreateDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MedicationsCodeCreateResponseToJson(
        MedicationsCodeCreateResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

MedicationsCodeIndexResponse _$MedicationsCodeIndexResponseFromJson(
        Map<String, dynamic> json) =>
    MedicationsCodeIndexResponse(
      json['data'] as String?,
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$MedicationsCodeIndexResponseToJson(
        MedicationsCodeIndexResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };

DoctorIndexResponse _$DoctorIndexResponseFromJson(Map<String, dynamic> json) =>
    DoctorIndexResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..successful = json['successful'] as bool?
      ..message = json['message'] as String?;

Map<String, dynamic> _$DoctorIndexResponseToJson(
        DoctorIndexResponse instance) =>
    <String, dynamic>{
      'successful': instance.successful,
      'message': instance.message,
      'data': instance.data,
    };
