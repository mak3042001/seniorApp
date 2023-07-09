import 'package:senior/app/constant.dart';
import 'package:senior/app/extension.dart';
import 'package:senior/data/response/response.dart';
import 'package:senior/domain/model/model.dart';

//message send
extension MessageSendResponseMabber on MessageSendResponse? {
  MessageSend toDomain() {
    return MessageSend();
  }
}

//medication
extension MedicationDataResponseMabber on MedicationDataResponse? {
  MedicationData toDomain() {
    return MedicationData(
      this?.id.orEmpty() ?? Constant.zero,
      this?.seniorId.orEmpty() ?? Constant.empty,
      this?.medication.orEmpty() ?? Constant.empty,
      this?.medicationDose.orEmpty() ?? Constant.zero,
      this?.description.orEmpty() ?? Constant.empty,
      this?.createdAt.orEmpty() ?? Constant.empty,
    );
  }
}

extension MedicationUseResponseMabber on MedicationUseResponse? {
  Medication toDomain() {
    return Medication(
        this?.data.toDomain(),
    );
  }
}
//message
extension MessageDataResponseMabber on MessageDataResponse? {
  MessageData toDomain() {
    return MessageData(
      this?.id.orEmpty() ?? Constant.zero,
      this?.username.orEmpty() ?? Constant.empty,
      this?.name.orEmpty() ?? Constant.empty,
      this?.email.orEmpty() ?? Constant.empty,
      this?.phone.orEmpty() ?? Constant.empty,
      this?.birthdate.orEmpty() ?? Constant.empty,
      this?.age.orEmpty() ?? Constant.zero,
      this?.image.orEmpty() ?? Constant.empty,
      this?.type.orEmpty() ?? Constant.empty,
      this?.message.orEmpty() ?? Constant.empty,
    );
  }
}

extension MessageUseResponseMabber on MessageUseResponse? {
  MessageIndex toDomain() {
    return MessageIndex(
      (this?.data?.map((e) => e.toDomain()) ?? const Iterable.empty())
          .cast<MessageData?>()
          .toList(),
    );
  }
}

//user
extension UserDataResponseMabber on UserDataResponse? {
  UserData toDomain() {
    return UserData(
      this?.id.orEmpty() ?? Constant.zero,
      this?.username.orEmpty() ?? Constant.empty,
      this?.name.orEmpty() ?? Constant.empty,
      this?.email.orEmpty() ?? Constant.empty,
      this?.phone.orEmpty() ?? Constant.empty,
      this?.birthdate.orEmpty() ?? Constant.empty,
      this?.age.orEmpty() ?? Constant.zero,
      this?.image.orEmpty() ?? Constant.empty,
      this?.type.orEmpty() ?? Constant.empty,
    );
  }
}

extension UserUseResponseMabber on UserUseResponse? {
  UserUser toDomain() {
    return UserUser(
      (this?.data?.map((e) => e.toDomain()) ?? const Iterable.empty())
          .cast<UserData?>()
          .toList(),
    );
  }
}

//profile mapper
extension ProfileDataResponseMabber on ProfileDataResponse? {
  ProfileData toDomain() {
    return ProfileData(
      this?.id.orEmpty() ?? Constant.zero,
      this?.username.orEmpty() ?? Constant.empty,
      this?.name.orEmpty() ?? Constant.empty,
      this?.email.orEmpty() ?? Constant.empty,
      this?.phone.orEmpty() ?? Constant.empty,
      this?.birthdate.orEmpty() ?? Constant.empty,
      this?.age.orEmpty() ?? Constant.zero,
      this?.image.orEmpty() ?? Constant.empty,
    );
  }
}

extension ProfileResponseMabber on ProfileResponse? {
  Profile toDomain() {
    return Profile(
      this?.data.toDomain(),
    );
  }
}

//auth mapper
extension DataResponseMabber on DataResponse? {
  Data toDomain() {
    return Data(
      this?.user.toDomain(),
      this?.token.orEmpty() ?? Constant.empty,
    );
  }
}

extension UserResponseMabber on UserResponse? {
  User toDomain() {
    return User(
      this?.id.orEmpty() ?? Constant.zero,
      this?.username.orEmpty() ?? Constant.empty,
      this?.name.orEmpty() ?? Constant.empty,
      this?.email.orEmpty() ?? Constant.empty,
      this?.phone.orEmpty() ?? Constant.empty,
      this?.birthdate.orEmpty() ?? Constant.empty,
      this?.age.orEmpty() ?? Constant.zero,
      this?.image.orEmpty() ?? Constant.empty,
    );
  }
}

extension AuthResponseMabber on AuthResponse? {
  Auth toDomain() {
    return Auth(
      this?.data.toDomain(),
    );
  }
}

//change image
extension ChangeImageResponseMabber on ChangeImageResponse? {
  ChangeImage toDomain() {
    return ChangeImage();
  }
}

extension ChangePasswordResponseMabber on ChangePasswordResponse? {
  ChangePassword toDomain() {
    return ChangePassword();
  }
}

//notification
extension NotificationDataResponseMabber on NotificationDataResponse? {
  NotificationData toDomain() {
    return NotificationData(
      this?.id.orEmpty() ?? Constant.zero,
      this?.title.orEmpty() ?? Constant.empty,
      this?.content.orEmpty() ?? Constant.empty,
      this?.seen.orEmpty() ?? Constant.empty,
      this?.createdAt.orEmpty() ?? Constant.empty,
    );
  }
}
extension NotificationDataIndexResponseMabber on NotificationDataIndexResponse? {
  NotificationIndex toDomain() {
    return NotificationIndex(
      (this?.data?.map((e) => e.toDomain()) ?? const Iterable.empty())
          .cast<NotificationData?>()
          .toList(),
    );
  }
}

//schedules create mapper
extension CreateSchedulesResponseMabber on CreateSchedulesResponse? {
  SchedulesCreate toDomain() {
    return SchedulesCreate();
  }
}

//schedules cancel mapper
extension CancelSchedulesResponseMabber on CancelSchedulesResponse? {
  SchedulesCancel toDomain() {
    return SchedulesCancel();
  }
}

//schedules index mapper
extension IndexSchedulesDataResponseMabber on IndexSchedulesDataResponse? {
  IndexSchedulesData toDomain() {
    return IndexSchedulesData(
      this?.id.orEmpty() ?? Constant.zero,
      this?.title.orEmpty() ?? Constant.empty,
      this?.description.orEmpty() ?? Constant.empty,
      this?.date.orEmpty() ?? Constant.empty,
      this?.time.orEmpty() ?? Constant.empty,
      this?.type.orEmpty() ?? Constant.empty,
      this?.createdAt.orEmpty() ?? Constant.empty,
    );
  }
}

extension IndexSchedulesResponseMabber on IndexSchedulesResponse? {
  IndexSchedules toDomain() {
    return IndexSchedules(
      (this?.data?.map((e) => e.toDomain()) ?? const Iterable.empty())
          .cast<IndexSchedulesData?>()
          .toList(),
    );
  }
}

//booking create mapper
extension CreateBookingResponseMabber on CreateBookingResponse? {
  CreateBooking toDomain() {
    return CreateBooking();
  }
}

//booking cancel mapper
extension CancelBookingResponseMabber on CancelBookingResponse? {
  CancelBooking toDomain() {
    return CancelBooking();
  }
}

//booking index mapper
extension DoctorResponseMabber on DoctorResponse? {
  Doctor toDomain() {
    return Doctor(
      this?.id.orEmpty() ?? Constant.zero,
      this?.username.orEmpty() ?? Constant.empty,
      this?.name.orEmpty() ?? Constant.empty,
      this?.email.orEmpty() ?? Constant.empty,
      this?.phone.orEmpty() ?? Constant.empty,
      this?.birthdate.orEmpty() ?? Constant.empty,
      this?.image.orEmpty() ?? Constant.empty,
      this?.address.orEmpty() ?? Constant.empty,
      this?.medicineCategory.orEmpty() ?? Constant.empty,
      this?.weekDays.orEmpty() ?? Constant.empty,
    );
  }
}

extension BookingDataResponseMabber on BookingDataResponse? {
  BookingData toDomain() {
    return BookingData(
      this?.id.orEmpty() ?? Constant.zero,
      this?.date.orEmpty() ?? Constant.empty,
      this?.status.orEmpty() ?? Constant.empty,
      this?.createdAt.orEmpty() ?? Constant.empty,
      this?.senior.toDomain(),
      this?.doctor.toDomain(),
    );
  }
}

extension IndexBookingResponseMabber on IndexBookingResponse? {
  IndexBooking toDomain() {
    return IndexBooking(
      (this?.data?.map((e) => e.toDomain()) ?? const Iterable.empty())
          .cast<BookingData?>()
          .toList(),
    );
  }
}

//history create mapper
extension HistoryCreateDataResponseMapper on HistoryCreateDataResponse? {
  HistoryCreateData toDomain() {
    return HistoryCreateData(
      this?.id.orEmpty() ?? Constant.zero,
      this?.title.orEmpty() ?? Constant.empty,
      this?.description.orEmpty() ?? Constant.empty,
      this?.userId.orEmpty() ?? Constant.zero,
      this?.historyCategoryId.orEmpty() ?? Constant.zero,
    );
  }
}

extension HistoryCreateResponseMapper on HistoryCreateResponse? {
  HistoryCreate toDomain() {
    return HistoryCreate(
      this?.data.toDomain(),
    );
  }
}

//history update mapper
extension HistoryUpdateResponseMabber on HistoryUpdateResponse? {
  HistoryUpdate toDomain() {
    return HistoryUpdate(this?.data.toDomain());
  }
}

//history cancel mapper
extension CancelHistoryResponseMabber on CancelHistoryResponse? {
  CancelHistory toDomain() {
    return CancelHistory();
  }
}

//history index mapper
extension HistoryIndexResponseMapper on HistoryIndexResponse? {
  HistoryIndex toDomain() {
    return HistoryIndex(
      (this?.data?.map((e) => e.toDomain()) ?? const Iterable.empty())
          .cast<HistoryCreateData?>()
          .toList(),
    );
  }
}

//historyCategories create mapper
extension HistoryCategoriesCreateDataResponseMapper
    on HistoryCategoriesCreateDataResponse? {
  HistoryCategoriesCreateData toDomain() {
    return HistoryCategoriesCreateData(
      this?.id.orEmpty() ?? Constant.zero,
      this?.title.orEmpty() ?? Constant.empty,
      this?.description.orEmpty() ?? Constant.empty,
      this?.userId.orEmpty() ?? Constant.zero,
    );
  }
}

extension HistoryCategoriesCreateResponseMapper
    on HistoryCategoriesCreateResponse? {
  HistoryCategoriesCreate toDomain() {
    return HistoryCategoriesCreate(
      this?.data.toDomain(),
    );
  }
}

//historyCategories update mapper
extension HistoryCategoriesUpdateResponseMapper
    on HistoryCategoriesUpdateResponse? {
  HistoryCategoriesUpdate toDomain() {
    return HistoryCategoriesUpdate(
      this?.data.toDomain(),
    );
  }
}

//historyCategories cancel mapper
extension CancelHistoryCategoriesResponseMabber
    on CancelHistoryCategoriesResponse? {
  CancelHistoryCategories toDomain() {
    return CancelHistoryCategories();
  }
}

//historyCategories index mapper
extension HistoryCategoriesIndexResponseMabber
    on HistoryCategoriesIndexResponse? {
  HistoryCategoriesIndex toDomain() {
    return HistoryCategoriesIndex(
      (this?.data?.map((e) => e.toDomain()) ?? const Iterable.empty())
          .cast<HistoryCategoriesCreateData?>()
          .toList(),
    );
  }
}

//medications create mapper
extension MedicationsCreateDataResponseMapper
    on MedicationsCreateDataResponse? {
  MedicationsCreateData toDomain() {
    return MedicationsCreateData(
      this?.id.orEmpty() ?? Constant.zero,
      this?.userId.orEmpty() ?? Constant.zero,
      this?.medication.orEmpty() ?? Constant.empty,
      this?.medicationDose.orEmpty() ?? Constant.zero,
      this?.description.orEmpty() ?? Constant.empty,
      this?.createdAt.orEmpty() ?? Constant.empty,
    );
  }
}

extension MedicationsCreateResponseMapper on MedicationsCreateResponse? {
  MedicationsCreate toDomain() {
    return MedicationsCreate(
      this?.data.toDomain(),
    );
  }
}

//medications update mapper
extension MedicationsUpdateResponseMabber on MedicationsUpdateResponse? {
  MedicationsUpdate toDomain() {
    return MedicationsUpdate();
  }
}

//medications cancel mapper
extension CancelMedicationsResponseMabber on CancelMedicationsResponse? {
  CancelMedications toDomain() {
    return CancelMedications();
  }
}

//medications index mapper
extension MedicationsIndexResponseMapper on MedicationsIndexResponse? {
  MedicationsIndex toDomain() {
    return MedicationsIndex(
      (this?.data?.map((e) => e.toDomain()) ?? const Iterable.empty())
          .cast<MedicationsCreateData?>()
          .toList(),
    );
  }
}

//medications code create mapper
extension MedicationsCodeCreateDataResponseMapper
on MedicationsCodeCreateDataResponse? {
  MedicationsCodeCreateData toDomain() {
    return MedicationsCodeCreateData(
      this?.data.orEmpty() ?? Constant.zero,
    );
  }
}

extension MedicationsCodeCreateResponseMapper on MedicationsCodeCreateResponse? {
  MedicationsCodeCreate toDomain() {
    return MedicationsCodeCreate(
      this?.data.toDomain(),
    );
  }
}

//medications code index mapper
extension MedicationsCodeIndexDataResponseMapper
on MedicationsCodeIndexResponse? {
  MedicationsCodeIndex toDomain() {
    return MedicationsCodeIndex(
      this?.data.orEmpty() ?? Constant.empty,
    );
  }
}

//doctor index
extension DoctorIndexResponseMapper on DoctorIndexResponse? {
  DoctorIndex toDomain() {
    return DoctorIndex(
      (this?.data?.map((e) => e.toDomain()) ?? const Iterable.empty())
          .cast<User?>()
          .toList(),
    );
  }
}