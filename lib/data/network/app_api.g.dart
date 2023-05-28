// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _AppServiceClient implements AppServiceClient {
  _AppServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://test.ahmed.center/final_project/public';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AuthResponse> login(
    String username,
    String password,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'username': username,
      'password': password,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AuthResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/login',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthLogOutResponse> logOut(
    String username,
    String password,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'username': username,
      'password': password,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AuthLogOutResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/logout',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthLogOutResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AuthResponse> register(
    String username,
    String name,
    String phone,
    String birthdate,
    String password,
    String confirmPassword,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'username': username,
      'name': name,
      'phone': phone,
      'birthdate': birthdate,
      'password': password,
      'confirm_password': confirmPassword,
    };
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<AuthResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/register',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CreateSchedulesResponse> schedulesCreate(
    String title,
    String date,
    String time,
    String type,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'title': title,
      'date': date,
      'time': time,
      'type': type,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreateSchedulesResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/schedules/create',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreateSchedulesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CancelSchedulesResponse> schedulesCancel(String scheduleId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'schedule_id': scheduleId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CancelSchedulesResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/schedules/cancel',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CancelSchedulesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<IndexSchedulesResponse> schedulesIndex() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<IndexSchedulesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/schedules',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = IndexSchedulesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CreateBookingResponse> bookingCreate(
    String doctorId,
    String date,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'doctor_id': doctorId,
      'date': date,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreateBookingResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/bookings/create',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreateBookingResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CancelBookingResponse> bookingCancel(String bookingId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'booking_id': bookingId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CancelBookingResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/bookings/cancel',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CancelBookingResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<IndexBookingResponse> bookingsIndex() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<IndexBookingResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/bookings',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = IndexBookingResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HistoryCreateResponse> historyCreate(
    String historyCategoryId,
    String title,
    String description,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'history_category_id': historyCategoryId,
      'title': title,
      'description': description,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HistoryCreateResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/history/create',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HistoryCreateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CancelHistoryResponse> historyCancel(String historyId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'history_id': historyId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CancelHistoryResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/history/delete',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CancelHistoryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HistoryUpdateResponse> historyUpdate(
    String historyCategoryId,
    String title,
    String description,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'history_category_id': historyCategoryId,
      'title': title,
      'description': description,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HistoryUpdateResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/history/update',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HistoryUpdateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HistoryIndexResponse> historyIndex() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HistoryIndexResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/history',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HistoryIndexResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HistoryCategoriesCreateResponse> historyCategoriesCreate(
    String title,
    String description,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'title': title,
      'description': description,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HistoryCategoriesCreateResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/history-categories/create',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HistoryCategoriesCreateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CancelHistoryCategoriesResponse> historyCategoriesCancel(
      String historyCategoryId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'history_category_id': historyCategoryId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CancelHistoryCategoriesResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/history-categories/delete',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CancelHistoryCategoriesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HistoryCategoriesUpdateResponse> historyCategoriesUpdate(
    String historyCategoryId,
    String title,
    String description,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'history_category_id': historyCategoryId,
      'title': title,
      'description': description,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HistoryCategoriesUpdateResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/history-categories/update',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HistoryCategoriesUpdateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HistoryCategoriesIndexResponse> historyCategoriesIndex() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HistoryCategoriesIndexResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'api/seniors/history-categories',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HistoryCategoriesIndexResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicationsCreateResponse> medicationsCreate(
    String medication,
    String medicationDose,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'medication': medication,
      'medication_dose': medicationDose,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicationsCreateResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/medications/create',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MedicationsCreateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CancelMedicationsResponse> medicationsCancel(
      String medicationId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'medication_id': medicationId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CancelMedicationsResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/medications/delete',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CancelMedicationsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicationsUpdateResponse> medicationsUpdate(
    String medicationId,
    String medication,
    String medicationDose,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'medication_id': medicationId,
      'medication': medication,
      'medication_dose': medicationDose,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicationsUpdateResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/medications/update',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MedicationsUpdateResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MedicationsIndexResponse> medicationsIndex() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MedicationsIndexResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/seniors/medications',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MedicationsIndexResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
