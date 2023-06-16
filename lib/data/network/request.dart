//auth request
class LoginRequest {
  String username;
  String password;

  LoginRequest(
    this.username,
    this.password,
  );
}

class RegisterRequest {
  String username;
  String name;
  String phone;
  String birthdate;
  String password;
  String confirmPassword;

  RegisterRequest(
    this.username,
    this.name,
    this.phone,
    this.birthdate,
    this.password,
    this.confirmPassword,
  );
}

//profile update
class UpdateProfileRequest {
  String name;
  String username;
  String phone;
  String birthdate;

  UpdateProfileRequest(
    this.name,
    this.username,
    this.phone,
    this.birthdate,
  );
}

//change image
class ChangeImageRequest {
  String image;

  ChangeImageRequest(this.image);
}

//schedules create
class SchedulesCreateRequest {
  String title;
  String date;
  String time;
  String type;

  SchedulesCreateRequest(
    this.title,
    this.date,
    this.time,
    this.type,
  );
}

//schedules cancel
class SchedulesCancelRequest {
  String scheduleId;

  SchedulesCancelRequest(this.scheduleId);
}

//bookings create
class BookingCreateRequest {
  String doctorId;
  String date;

  BookingCreateRequest(
    this.doctorId,
    this.date,
  );
}

//bookings cancel
class BookingCancelRequest {
  String bookingId;

  BookingCancelRequest(this.bookingId);
}

//history create
class HistoryCreateRequest {
  int historyCategoryId;
  String title;
  String description;

  HistoryCreateRequest(
    this.historyCategoryId,
    this.title,
    this.description,
  );
}

//history cancel
class HistoryCancelRequest {
  int historyId;

  HistoryCancelRequest(this.historyId);
}

//history update
class HistoryUpdateRequest {
  int historyCategoryId;
  String title;
  String description;

  HistoryUpdateRequest(
    this.historyCategoryId,
    this.title,
    this.description,
  );
}

//historyCategories create
class HistoryCategoriesCreateRequest {
  String title;
  String description;

  HistoryCategoriesCreateRequest(
    this.title,
    this.description,
  );
}

//historyCategories cancel
class HistoryCategoriesCancelRequest {
  int historyCategoriesId;

  HistoryCategoriesCancelRequest(this.historyCategoriesId);
}

//historyCategories update
class HistoryCategoriesUpdateRequest {
  int historyCategoryId;
  String title;
  String description;

  HistoryCategoriesUpdateRequest(
    this.historyCategoryId,
    this.title,
    this.description,
  );
}

//medications create
class MedicationsCreateRequest {
  String medication;
  String medicationDose;

  MedicationsCreateRequest(
    this.medication,
    this.medicationDose,
  );
}

//medications cancel
class MedicationsCancelRequest {
  int medicationId;

  MedicationsCancelRequest(this.medicationId);
}

//medications update
class MedicationsUpdateRequest {
  int medicationId;
  String medication;
  String medicationDose;

  MedicationsUpdateRequest(
    this.medicationId,
    this.medication,
    this.medicationDose,
  );
}
