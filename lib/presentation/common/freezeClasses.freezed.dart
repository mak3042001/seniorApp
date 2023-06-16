// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezeClasses.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginObject {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginobjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$_LoginobjectCopyWith(
          _$_Loginobject value, $Res Function(_$_Loginobject) then) =
      __$$_LoginobjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_LoginobjectCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$_Loginobject>
    implements _$$_LoginobjectCopyWith<$Res> {
  __$$_LoginobjectCopyWithImpl(
      _$_Loginobject _value, $Res Function(_$_Loginobject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_Loginobject(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Loginobject implements _Loginobject {
  _$_Loginobject(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loginobject &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginobjectCopyWith<_$_Loginobject> get copyWith =>
      __$$_LoginobjectCopyWithImpl<_$_Loginobject>(this, _$identity);
}

abstract class _Loginobject implements LoginObject {
  factory _Loginobject(final String email, final String password) =
      _$_Loginobject;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginobjectCopyWith<_$_Loginobject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterObject {
  String get username => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get birthdate => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterObjectCopyWith<RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterObjectCopyWith<$Res> {
  factory $RegisterObjectCopyWith(
          RegisterObject value, $Res Function(RegisterObject) then) =
      _$RegisterObjectCopyWithImpl<$Res, RegisterObject>;
  @useResult
  $Res call(
      {String username,
      String name,
      String phone,
      String birthdate,
      String password,
      String confirmPassword});
}

/// @nodoc
class _$RegisterObjectCopyWithImpl<$Res, $Val extends RegisterObject>
    implements $RegisterObjectCopyWith<$Res> {
  _$RegisterObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? name = null,
    Object? phone = null,
    Object? birthdate = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterObjectCopyWith<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  factory _$$_RegisterObjectCopyWith(
          _$_RegisterObject value, $Res Function(_$_RegisterObject) then) =
      __$$_RegisterObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String name,
      String phone,
      String birthdate,
      String password,
      String confirmPassword});
}

/// @nodoc
class __$$_RegisterObjectCopyWithImpl<$Res>
    extends _$RegisterObjectCopyWithImpl<$Res, _$_RegisterObject>
    implements _$$_RegisterObjectCopyWith<$Res> {
  __$$_RegisterObjectCopyWithImpl(
      _$_RegisterObject _value, $Res Function(_$_RegisterObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? name = null,
    Object? phone = null,
    Object? birthdate = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$_RegisterObject(
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterObject implements _RegisterObject {
  _$_RegisterObject(this.username, this.name, this.phone, this.birthdate,
      this.password, this.confirmPassword);

  @override
  final String username;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String birthdate;
  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'RegisterObject(username: $username, name: $name, phone: $phone, birthdate: $birthdate, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterObject &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, username, name, phone, birthdate, password, confirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterObjectCopyWith<_$_RegisterObject> get copyWith =>
      __$$_RegisterObjectCopyWithImpl<_$_RegisterObject>(this, _$identity);
}

abstract class _RegisterObject implements RegisterObject {
  factory _RegisterObject(
      final String username,
      final String name,
      final String phone,
      final String birthdate,
      final String password,
      final String confirmPassword) = _$_RegisterObject;

  @override
  String get username;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get birthdate;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterObjectCopyWith<_$_RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SchedulesCreateObject {
  String get title => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SchedulesCreateObjectCopyWith<SchedulesCreateObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SchedulesCreateObjectCopyWith<$Res> {
  factory $SchedulesCreateObjectCopyWith(SchedulesCreateObject value,
          $Res Function(SchedulesCreateObject) then) =
      _$SchedulesCreateObjectCopyWithImpl<$Res, SchedulesCreateObject>;
  @useResult
  $Res call({String title, String date, String time, String type});
}

/// @nodoc
class _$SchedulesCreateObjectCopyWithImpl<$Res,
        $Val extends SchedulesCreateObject>
    implements $SchedulesCreateObjectCopyWith<$Res> {
  _$SchedulesCreateObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? date = null,
    Object? time = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SchedulesCreateObjectCopyWith<$Res>
    implements $SchedulesCreateObjectCopyWith<$Res> {
  factory _$$_SchedulesCreateObjectCopyWith(_$_SchedulesCreateObject value,
          $Res Function(_$_SchedulesCreateObject) then) =
      __$$_SchedulesCreateObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String date, String time, String type});
}

/// @nodoc
class __$$_SchedulesCreateObjectCopyWithImpl<$Res>
    extends _$SchedulesCreateObjectCopyWithImpl<$Res, _$_SchedulesCreateObject>
    implements _$$_SchedulesCreateObjectCopyWith<$Res> {
  __$$_SchedulesCreateObjectCopyWithImpl(_$_SchedulesCreateObject _value,
      $Res Function(_$_SchedulesCreateObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? date = null,
    Object? time = null,
    Object? type = null,
  }) {
    return _then(_$_SchedulesCreateObject(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SchedulesCreateObject implements _SchedulesCreateObject {
  _$_SchedulesCreateObject(this.title, this.date, this.time, this.type);

  @override
  final String title;
  @override
  final String date;
  @override
  final String time;
  @override
  final String type;

  @override
  String toString() {
    return 'SchedulesCreateObject(title: $title, date: $date, time: $time, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SchedulesCreateObject &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, date, time, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SchedulesCreateObjectCopyWith<_$_SchedulesCreateObject> get copyWith =>
      __$$_SchedulesCreateObjectCopyWithImpl<_$_SchedulesCreateObject>(
          this, _$identity);
}

abstract class _SchedulesCreateObject implements SchedulesCreateObject {
  factory _SchedulesCreateObject(final String title, final String date,
      final String time, final String type) = _$_SchedulesCreateObject;

  @override
  String get title;
  @override
  String get date;
  @override
  String get time;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$_SchedulesCreateObjectCopyWith<_$_SchedulesCreateObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BookingCreateObject {
  String get doctorId => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookingCreateObjectCopyWith<BookingCreateObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingCreateObjectCopyWith<$Res> {
  factory $BookingCreateObjectCopyWith(
          BookingCreateObject value, $Res Function(BookingCreateObject) then) =
      _$BookingCreateObjectCopyWithImpl<$Res, BookingCreateObject>;
  @useResult
  $Res call({String doctorId, String date});
}

/// @nodoc
class _$BookingCreateObjectCopyWithImpl<$Res, $Val extends BookingCreateObject>
    implements $BookingCreateObjectCopyWith<$Res> {
  _$BookingCreateObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookingCreateObjectCopyWith<$Res>
    implements $BookingCreateObjectCopyWith<$Res> {
  factory _$$_BookingCreateObjectCopyWith(_$_BookingCreateObject value,
          $Res Function(_$_BookingCreateObject) then) =
      __$$_BookingCreateObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String doctorId, String date});
}

/// @nodoc
class __$$_BookingCreateObjectCopyWithImpl<$Res>
    extends _$BookingCreateObjectCopyWithImpl<$Res, _$_BookingCreateObject>
    implements _$$_BookingCreateObjectCopyWith<$Res> {
  __$$_BookingCreateObjectCopyWithImpl(_$_BookingCreateObject _value,
      $Res Function(_$_BookingCreateObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctorId = null,
    Object? date = null,
  }) {
    return _then(_$_BookingCreateObject(
      null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BookingCreateObject implements _BookingCreateObject {
  _$_BookingCreateObject(this.doctorId, this.date);

  @override
  final String doctorId;
  @override
  final String date;

  @override
  String toString() {
    return 'BookingCreateObject(doctorId: $doctorId, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookingCreateObject &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, doctorId, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookingCreateObjectCopyWith<_$_BookingCreateObject> get copyWith =>
      __$$_BookingCreateObjectCopyWithImpl<_$_BookingCreateObject>(
          this, _$identity);
}

abstract class _BookingCreateObject implements BookingCreateObject {
  factory _BookingCreateObject(final String doctorId, final String date) =
      _$_BookingCreateObject;

  @override
  String get doctorId;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$_BookingCreateObjectCopyWith<_$_BookingCreateObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileObject {
  String get username => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get birthdate => throw _privateConstructorUsedError;
  String get currentPassword => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileObjectCopyWith<ProfileObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileObjectCopyWith<$Res> {
  factory $ProfileObjectCopyWith(
          ProfileObject value, $Res Function(ProfileObject) then) =
      _$ProfileObjectCopyWithImpl<$Res, ProfileObject>;
  @useResult
  $Res call(
      {String username,
      String name,
      String phone,
      String birthdate,
      String currentPassword,
      String password,
      String confirmPassword});
}

/// @nodoc
class _$ProfileObjectCopyWithImpl<$Res, $Val extends ProfileObject>
    implements $ProfileObjectCopyWith<$Res> {
  _$ProfileObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? name = null,
    Object? phone = null,
    Object? birthdate = null,
    Object? currentPassword = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String,
      currentPassword: null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileObjectCopyWith<$Res>
    implements $ProfileObjectCopyWith<$Res> {
  factory _$$_ProfileObjectCopyWith(
          _$_ProfileObject value, $Res Function(_$_ProfileObject) then) =
      __$$_ProfileObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String name,
      String phone,
      String birthdate,
      String currentPassword,
      String password,
      String confirmPassword});
}

/// @nodoc
class __$$_ProfileObjectCopyWithImpl<$Res>
    extends _$ProfileObjectCopyWithImpl<$Res, _$_ProfileObject>
    implements _$$_ProfileObjectCopyWith<$Res> {
  __$$_ProfileObjectCopyWithImpl(
      _$_ProfileObject _value, $Res Function(_$_ProfileObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? name = null,
    Object? phone = null,
    Object? birthdate = null,
    Object? currentPassword = null,
    Object? password = null,
    Object? confirmPassword = null,
  }) {
    return _then(_$_ProfileObject(
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      null == birthdate
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as String,
      null == currentPassword
          ? _value.currentPassword
          : currentPassword // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ProfileObject implements _ProfileObject {
  _$_ProfileObject(this.username, this.name, this.phone, this.birthdate,
      this.currentPassword, this.password, this.confirmPassword);

  @override
  final String username;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String birthdate;
  @override
  final String currentPassword;
  @override
  final String password;
  @override
  final String confirmPassword;

  @override
  String toString() {
    return 'ProfileObject(username: $username, name: $name, phone: $phone, birthdate: $birthdate, currentPassword: $currentPassword, password: $password, confirmPassword: $confirmPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileObject &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.currentPassword, currentPassword) ||
                other.currentPassword == currentPassword) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, name, phone, birthdate,
      currentPassword, password, confirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileObjectCopyWith<_$_ProfileObject> get copyWith =>
      __$$_ProfileObjectCopyWithImpl<_$_ProfileObject>(this, _$identity);
}

abstract class _ProfileObject implements ProfileObject {
  factory _ProfileObject(
      final String username,
      final String name,
      final String phone,
      final String birthdate,
      final String currentPassword,
      final String password,
      final String confirmPassword) = _$_ProfileObject;

  @override
  String get username;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get birthdate;
  @override
  String get currentPassword;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileObjectCopyWith<_$_ProfileObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HistoryCategoriesObject {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryCategoriesObjectCopyWith<HistoryCategoriesObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryCategoriesObjectCopyWith<$Res> {
  factory $HistoryCategoriesObjectCopyWith(HistoryCategoriesObject value,
          $Res Function(HistoryCategoriesObject) then) =
      _$HistoryCategoriesObjectCopyWithImpl<$Res, HistoryCategoriesObject>;
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class _$HistoryCategoriesObjectCopyWithImpl<$Res,
        $Val extends HistoryCategoriesObject>
    implements $HistoryCategoriesObjectCopyWith<$Res> {
  _$HistoryCategoriesObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoryCategoriesObjectCopyWith<$Res>
    implements $HistoryCategoriesObjectCopyWith<$Res> {
  factory _$$_HistoryCategoriesObjectCopyWith(_$_HistoryCategoriesObject value,
          $Res Function(_$_HistoryCategoriesObject) then) =
      __$$_HistoryCategoriesObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class __$$_HistoryCategoriesObjectCopyWithImpl<$Res>
    extends _$HistoryCategoriesObjectCopyWithImpl<$Res,
        _$_HistoryCategoriesObject>
    implements _$$_HistoryCategoriesObjectCopyWith<$Res> {
  __$$_HistoryCategoriesObjectCopyWithImpl(_$_HistoryCategoriesObject _value,
      $Res Function(_$_HistoryCategoriesObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$_HistoryCategoriesObject(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HistoryCategoriesObject implements _HistoryCategoriesObject {
  _$_HistoryCategoriesObject(this.title, this.description);

  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'HistoryCategoriesObject(title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryCategoriesObject &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryCategoriesObjectCopyWith<_$_HistoryCategoriesObject>
      get copyWith =>
          __$$_HistoryCategoriesObjectCopyWithImpl<_$_HistoryCategoriesObject>(
              this, _$identity);
}

abstract class _HistoryCategoriesObject implements HistoryCategoriesObject {
  factory _HistoryCategoriesObject(
          final String title, final String description) =
      _$_HistoryCategoriesObject;

  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryCategoriesObjectCopyWith<_$_HistoryCategoriesObject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HistoryCategoriesUpdateObject {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryCategoriesUpdateObjectCopyWith<HistoryCategoriesUpdateObject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryCategoriesUpdateObjectCopyWith<$Res> {
  factory $HistoryCategoriesUpdateObjectCopyWith(
          HistoryCategoriesUpdateObject value,
          $Res Function(HistoryCategoriesUpdateObject) then) =
      _$HistoryCategoriesUpdateObjectCopyWithImpl<$Res,
          HistoryCategoriesUpdateObject>;
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class _$HistoryCategoriesUpdateObjectCopyWithImpl<$Res,
        $Val extends HistoryCategoriesUpdateObject>
    implements $HistoryCategoriesUpdateObjectCopyWith<$Res> {
  _$HistoryCategoriesUpdateObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoryCategoriesUpdateObjectCopyWith<$Res>
    implements $HistoryCategoriesUpdateObjectCopyWith<$Res> {
  factory _$$_HistoryCategoriesUpdateObjectCopyWith(
          _$_HistoryCategoriesUpdateObject value,
          $Res Function(_$_HistoryCategoriesUpdateObject) then) =
      __$$_HistoryCategoriesUpdateObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class __$$_HistoryCategoriesUpdateObjectCopyWithImpl<$Res>
    extends _$HistoryCategoriesUpdateObjectCopyWithImpl<$Res,
        _$_HistoryCategoriesUpdateObject>
    implements _$$_HistoryCategoriesUpdateObjectCopyWith<$Res> {
  __$$_HistoryCategoriesUpdateObjectCopyWithImpl(
      _$_HistoryCategoriesUpdateObject _value,
      $Res Function(_$_HistoryCategoriesUpdateObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$_HistoryCategoriesUpdateObject(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HistoryCategoriesUpdateObject
    implements _HistoryCategoriesUpdateObject {
  _$_HistoryCategoriesUpdateObject(this.title, this.description);

  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'HistoryCategoriesUpdateObject(title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryCategoriesUpdateObject &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryCategoriesUpdateObjectCopyWith<_$_HistoryCategoriesUpdateObject>
      get copyWith => __$$_HistoryCategoriesUpdateObjectCopyWithImpl<
          _$_HistoryCategoriesUpdateObject>(this, _$identity);
}

abstract class _HistoryCategoriesUpdateObject
    implements HistoryCategoriesUpdateObject {
  factory _HistoryCategoriesUpdateObject(
          final String title, final String description) =
      _$_HistoryCategoriesUpdateObject;

  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryCategoriesUpdateObjectCopyWith<_$_HistoryCategoriesUpdateObject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HistoryObject {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryObjectCopyWith<HistoryObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryObjectCopyWith<$Res> {
  factory $HistoryObjectCopyWith(
          HistoryObject value, $Res Function(HistoryObject) then) =
      _$HistoryObjectCopyWithImpl<$Res, HistoryObject>;
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class _$HistoryObjectCopyWithImpl<$Res, $Val extends HistoryObject>
    implements $HistoryObjectCopyWith<$Res> {
  _$HistoryObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoryObjectCopyWith<$Res>
    implements $HistoryObjectCopyWith<$Res> {
  factory _$$_HistoryObjectCopyWith(
          _$_HistoryObject value, $Res Function(_$_HistoryObject) then) =
      __$$_HistoryObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class __$$_HistoryObjectCopyWithImpl<$Res>
    extends _$HistoryObjectCopyWithImpl<$Res, _$_HistoryObject>
    implements _$$_HistoryObjectCopyWith<$Res> {
  __$$_HistoryObjectCopyWithImpl(
      _$_HistoryObject _value, $Res Function(_$_HistoryObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$_HistoryObject(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HistoryObject implements _HistoryObject {
  _$_HistoryObject(this.title, this.description);

  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'HistoryObject(title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryObject &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryObjectCopyWith<_$_HistoryObject> get copyWith =>
      __$$_HistoryObjectCopyWithImpl<_$_HistoryObject>(this, _$identity);
}

abstract class _HistoryObject implements HistoryObject {
  factory _HistoryObject(final String title, final String description) =
      _$_HistoryObject;

  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryObjectCopyWith<_$_HistoryObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HistoryUpdateObject {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryUpdateObjectCopyWith<HistoryUpdateObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryUpdateObjectCopyWith<$Res> {
  factory $HistoryUpdateObjectCopyWith(
          HistoryUpdateObject value, $Res Function(HistoryUpdateObject) then) =
      _$HistoryUpdateObjectCopyWithImpl<$Res, HistoryUpdateObject>;
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class _$HistoryUpdateObjectCopyWithImpl<$Res, $Val extends HistoryUpdateObject>
    implements $HistoryUpdateObjectCopyWith<$Res> {
  _$HistoryUpdateObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoryUpdateObjectCopyWith<$Res>
    implements $HistoryUpdateObjectCopyWith<$Res> {
  factory _$$_HistoryUpdateObjectCopyWith(_$_HistoryUpdateObject value,
          $Res Function(_$_HistoryUpdateObject) then) =
      __$$_HistoryUpdateObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description});
}

/// @nodoc
class __$$_HistoryUpdateObjectCopyWithImpl<$Res>
    extends _$HistoryUpdateObjectCopyWithImpl<$Res, _$_HistoryUpdateObject>
    implements _$$_HistoryUpdateObjectCopyWith<$Res> {
  __$$_HistoryUpdateObjectCopyWithImpl(_$_HistoryUpdateObject _value,
      $Res Function(_$_HistoryUpdateObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$_HistoryUpdateObject(
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HistoryUpdateObject implements _HistoryUpdateObject {
  _$_HistoryUpdateObject(this.title, this.description);

  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'HistoryUpdateObject(title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryUpdateObject &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryUpdateObjectCopyWith<_$_HistoryUpdateObject> get copyWith =>
      __$$_HistoryUpdateObjectCopyWithImpl<_$_HistoryUpdateObject>(
          this, _$identity);
}

abstract class _HistoryUpdateObject implements HistoryUpdateObject {
  factory _HistoryUpdateObject(final String title, final String description) =
      _$_HistoryUpdateObject;

  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryUpdateObjectCopyWith<_$_HistoryUpdateObject> get copyWith =>
      throw _privateConstructorUsedError;
}
