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
  Future<CreateSchedulesResponse> schedulesCancel(String scheduleId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'schedule_id': scheduleId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreateSchedulesResponse>(Options(
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
    final value = CreateSchedulesResponse.fromJson(_result.data!);
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
  Future<CreateSchedulesResponse> bookingCreate(
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
        _setStreamType<CreateSchedulesResponse>(Options(
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
    final value = CreateSchedulesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CreateSchedulesResponse> bookingCancel(String bookingId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'booking_id': bookingId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreateSchedulesResponse>(Options(
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
    final value = CreateSchedulesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<IndexSchedulesResponse> bookingsIndex() async {
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
              '/api/seniors/bookings',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = IndexSchedulesResponse.fromJson(_result.data!);
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
