//message
class MessageData {
  int id;
  String username;
  String name;
  String email;
  String phone;
  String birthdate;
  int age;
  String image;
  String type;
  String message;

  MessageData(
      this.id,
      this.username,
      this.name,
      this.email,
      this.phone,
      this.birthdate,
      this.age,
      this.image,
      this.type,
      this.message,
      );
}

class Message {
  List<MessageData?>? data;

  Message(
      this.data,
      );
}

//user
class UserData {
  int id;
  String username;
  String name;
  String email;
  String phone;
  String birthdate;
  int age;
  String image;
  String type;

  UserData(
      this.id,
      this.username,
      this.name,
      this.email,
      this.phone,
      this.birthdate,
      this.age,
      this.image,
      this.type,
      );
}

class UserUser {
  List<UserData?>? data;

  UserUser(
      this.data,
      );
}

//profile
class ProfileData {
  int id;
  String username;
  String name;
  String email;
  String phone;
  String birthdate;
  int age;
  String image;

  ProfileData(
      this.id,
      this.username,
      this.name,
      this.email,
      this.phone,
      this.birthdate,
      this.age,
      this.image,
      );
}

class Profile {
  ProfileData? data;

  Profile(
      this.data,
      );
}

//auth model
class Data {
  User? user;
  String token;

  Data(
    this.user,
    this.token,
  );
}

class User {
  int id;
  String username;
  String name;
  String email;
  String phone;
  String birthdate;
  int age;
  String image;

  User(
    this.id,
    this.username,
    this.name,
    this.email,
    this.phone,
    this.birthdate,
    this.age,
    this.image,
  );
}

class Auth {
  Data? data;

  Auth(
    this.data,
  );
}

class AuthLogOut {
  AuthLogOut();
}

//change image & password
class ChangeImage {
  ChangeImage();
}
class ChangePassword {
  ChangePassword();
}

//notification
class NotificationData {
  int id;
  String title;
  String content;
  String seen;
  String createdAt;

  NotificationData(
    this.id,
    this.title,
    this.content,
    this.seen,
    this.createdAt,
  );
}
class NotificationIndex {

  List<NotificationData?> data;

  NotificationIndex(this.data);
}

//schedules create
class SchedulesCreate {
  SchedulesCreate();
}

//schedules cancel
class SchedulesCancel {
  SchedulesCancel();
}

//schedules index
class IndexSchedulesData {
  int id;
  String title;
  String description;
  String date;
  String time;
  String type;
  String createdAt;

  IndexSchedulesData(
    this.id,
    this.title,
    this.description,
    this.date,
    this.time,
    this.type,
    this.createdAt,
  );
}

class IndexSchedules {
  List<IndexSchedulesData?> data;

  IndexSchedules(
    this.data,
  );
}

//booking create
class CreateBooking {
  CreateBooking();
}

//booking cancel
class CancelBooking {
  CancelBooking();
}

//booking index
class Doctor {
  int id;
  String username;
  String name;
  String email;
  String phone;
  String birthdate;
  String image;
  String address;
  String medicineCategory;
  String weekDays;

  Doctor(
      this.id,
      this.username,
      this.name,
      this.email,
      this.phone,
      this.birthdate,
      this.image,
      this.address,
      this.medicineCategory,
      this.weekDays);
}

class BookingData {
  int id;
  String date;
  String status;
  String createdAt;
  User? senior;
  Doctor? doctor;

  BookingData(
    this.id,
    this.date,
    this.status,
    this.createdAt,
    this.senior,
    this.doctor,
  );
}

class IndexBooking {
  List<BookingData?> data;

  IndexBooking(
    this.data,
  );
}

//history create
class HistoryCreateData {
  int id;
  String title;
  String description;
  int userId;
  int historyCategoryId;

  HistoryCreateData(
    this.id,
    this.title,
    this.description,
    this.userId,
    this.historyCategoryId,
  );
}

class HistoryCreate {
  HistoryCreateData? data;

  HistoryCreate(
    this.data,
  );
}

//history update
class HistoryUpdate {
  HistoryCreateData? data;

  HistoryUpdate(
    this.data,
  );
}

//history cancel
class CancelHistory {
  CancelHistory();
}

//history index
class HistoryIndex {
  List<HistoryCreateData?> data;

  HistoryIndex(
    this.data,
  );
}

//historyCategories create
class HistoryCategoriesCreateData {
  int id;
  String title;
  String description;
  int userId;

  HistoryCategoriesCreateData(
    this.id,
    this.title,
    this.description,
    this.userId,
  );
}

class HistoryCategoriesCreate {
  HistoryCategoriesCreateData? data;

  HistoryCategoriesCreate(
    this.data,
  );
}

//historyCategories update
class HistoryCategoriesUpdate {
  HistoryCategoriesCreateData? data;

  HistoryCategoriesUpdate(
    this.data,
  );
}

//historyCategories cancel
class CancelHistoryCategories {
  CancelHistoryCategories();
}

//historyCategories index
class HistoryCategoriesIndex {
  List<HistoryCategoriesCreateData?> data;

  HistoryCategoriesIndex(
    this.data,
  );
}

//medications create
class MedicationsCreateData {
  int id;
  int userId;
  String medication;
  int medicationDose;
  String description;
  String createdAt;

  MedicationsCreateData(
    this.id,
    this.userId,
    this.medication,
    this.medicationDose,
    this.description,
    this.createdAt,
  );
}

class MedicationsCreate {
  MedicationsCreateData? data;

  MedicationsCreate(
    this.data,
  );
}

//medications update
class MedicationsUpdate {
  MedicationsUpdate();
}

//medications cancel
class CancelMedications {
  CancelMedications();
}

//medications index
class MedicationsIndex {
  List<MedicationsCreateData?> data;

  MedicationsIndex(
    this.data,
  );
}

//medications code create
class MedicationsCodeCreateData {
  int data;

  MedicationsCodeCreateData(this.data);
}

class MedicationsCodeCreate {
  MedicationsCodeCreateData? data;

  MedicationsCodeCreate(
      this.data,
      );
}

//medications code index
class MedicationsCodeIndex {
  String data;

  MedicationsCodeIndex(
      this.data,
      );
}

//doctor index
class DoctorIndex {
  List<User?>? data;

  DoctorIndex(
      this.data,
      );
}