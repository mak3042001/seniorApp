
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:senior/app/constant.dart';
import 'package:senior/data/response/response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

//medicine
  @GET("/api/seniors/medications/show")
  Future<MedicationUseResponse> medicine(
      @Query("name") String name,
      );
//message
  @GET("/api/guest/massages")
  Future<MessageUseResponse> message(
      @Query("user_id") int userId,
      );

//user
  @GET("/api/guest/users")
  Future<UserUseResponse> user();

//login
  @POST("/api/seniors/login")
  Future<AuthResponse> login(
    @Field("username") String username,
    @Field("password") String password,
  );

//logout
  @POST("/api/seniors/logout")
  Future<AuthLogOutResponse> logOut(
    @Field("username") String username,
    @Field("password") String password,
  );

//register
  @POST("/api/seniors/register")
  Future<AuthResponse> register(
    @Field("username") String username,
    @Field("name") String name,
    @Field("phone") String phone,
    @Field("birthdate") String birthdate,
    @Field("password") String password,
    @Field("confirm_password") String confirmPassword,
  );

//show profile
  @GET("/api/seniors/profile")
  Future<ProfileResponse> showProfile();

//update profile
  @POST("/api/seniors/profile/update")
  Future<AuthResponse> updateProfile(
      @Field("name") String name,
      @Field("username") String username,
      @Field("phone") String phone,
      @Field("birthdate") String birthdate,
      );

//change image profile & password
  @POST("/api/seniors/profile/changeImage")
  Future<ChangeImageResponse> changeImage(
      @Part(fileName: "image") File image,
      );

  @POST("/api/seniors/profile/changePassword")
  Future<ChangePasswordResponse> changePassword(
      @Field("old_password") String currentPassword,
      @Field("password") String password,
      @Field("confirm_password") String confirmPassword,
      );

//index notification
  @GET("/api/seniors/notifications")
  Future<NotificationDataIndexResponse> notificationIndex();


//schedules create
  @POST("/api/seniors/schedules/create")
  Future<CreateSchedulesResponse> schedulesCreate(
    @Field("title") String title,
    @Field("date") String date,
    @Field("time") String time,
    @Field("type") String type,
    @Field("description") String? description,
  );

//schedules cancel
  @POST("/api/seniors/schedules/cancel")
  Future<CancelSchedulesResponse> schedulesCancel(
    @Field("schedule_id") int scheduleId,
  );

//schedules index
  @GET("/api/seniors/schedules")
  Future<IndexSchedulesResponse> schedulesIndex(
      @Query("user_id") int userId,
      );






//bookings create
  @POST("/api/seniors/bookings/create")
  Future<CreateBookingResponse> bookingCreate(
      @Field("doctor_id") String doctorId,
      @Field("date") String date,
      );

//bookings cancel
  @POST("/api/seniors/bookings/cancel")
  Future<CancelBookingResponse> bookingCancel(
      @Field("booking_id") int bookingId,
      );
//bookings index
  @GET("/api/seniors/bookings")
  Future<IndexBookingResponse> bookingsIndex();





//history create
  @POST("/api/seniors/history/create")
  Future<HistoryCreateResponse> historyCreate(
      @Field("history_category_id") int historyCategoryId,
      @Field("title") String title,
      @Field("description") String description,
      );
//history cancel
  @POST("/api/seniors/history/delete")
  Future<CancelHistoryResponse> historyCancel(
      @Field("history_id") int historyId,
      );

//history update
  @POST("/api/seniors/history/update")
  Future<HistoryUpdateResponse> historyUpdate(
      @Field("history_id") int historyId,
      @Field("title") String title,
      @Field("description") String description,
      );
//history index
  @GET("/api/seniors/history")
  Future<HistoryIndexResponse> historyIndex(
      @Query("history_category_id") int historyCategoryId,
      );




//historyCategories create
  @POST("/api/seniors/history-categories/create")
  Future<HistoryCategoriesCreateResponse> historyCategoriesCreate(
      @Field("title") String title,
      @Field("description") String description,
      );
//historyCategories cancel
  @POST("/api/seniors/history-categories/delete")
  Future<CancelHistoryCategoriesResponse> historyCategoriesCancel(
      @Field("history_category_id") int historyCategoryId,
      );

//historyCategories update
  @POST("/api/seniors/history-categories/update")
  Future<HistoryCategoriesUpdateResponse> historyCategoriesUpdate(
      @Field("history_category_id") int historyCategoryId,
      @Field("title") String title,
      @Field("description") String description,
      );
//historyCategories index
  @GET("/api/seniors/history-categories")
  Future<HistoryCategoriesIndexResponse> historyCategoriesIndex();




//medications create
  @POST("/api/seniors/medications/create")
  Future<MedicationsCreateResponse> medicationsCreate(
      @Field("medication") String medication,
      @Field("medication_dose") String medicationDose,
      @Field("description") String? description,
      );

//medications cancel
  @POST("/api/seniors/medications/delete")
  Future<CancelMedicationsResponse> medicationsCancel(
      @Field("medication_id") int medicationId,
      );

//medications update
  @POST("/api/seniors/medications/update")
  Future<MedicationsUpdateResponse> medicationsUpdate(
      @Field("medication_id") int medicationId,
      @Field("medication") String? medication,
      @Field("medication_dose") String? medicationDose,
      @Field("description") String? description,
      );
//medications index
  @GET("/api/seniors/medications")
  Future<MedicationsIndexResponse> medicationsIndex();


//medications code create
  @POST("/api/seniors/medications-code/create")
  Future<MedicationsCodeCreateResponse> medicationsCodeCreate();

//medications code index
  @GET("/api/seniors/medications-code/last")
  Future<MedicationsCodeIndexResponse> medicationsCodeIndex();

  //doctor index
  @GET("/api/guest/doctors")
  Future<DoctorIndexResponse> doctorIndex();
}




