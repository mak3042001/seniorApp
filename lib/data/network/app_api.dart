import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:senior/app/constant.dart';
import 'package:senior/data/response/response.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
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

//schedules create
  @POST("/api/seniors/schedules/create")
  Future<CreateSchedulesResponse> schedulesCreate(
    @Field("title") String title,
    @Field("date") String date,
    @Field("time") String time,
    @Field("type") String type,
  );

//schedules cancel
  @POST("/api/seniors/schedules/cancel")
  Future<CancelSchedulesResponse> schedulesCancel(
    @Field("schedule_id") String scheduleId,
  );

//schedules index
  @GET("/api/seniors/schedules")
  Future<IndexSchedulesResponse> schedulesIndex();






//bookings create
  @POST("/api/seniors/bookings/create")
  Future<CreateBookingResponse> bookingCreate(
      @Field("doctor_id") String doctorId,
      @Field("date") String date,
      );

//bookings cancel
  @POST("/api/seniors/bookings/cancel")
  Future<CancelBookingResponse> bookingCancel(
      @Field("booking_id") String bookingId,
      );
//bookings index
  @GET("/api/seniors/bookings")
  Future<IndexBookingResponse> bookingsIndex();





//history create
  @POST("/api/seniors/history/create")
  Future<HistoryCreateResponse> historyCreate(
      @Field("history_category_id") String historyCategoryId,
      @Field("title") String title,
      @Field("description") String description,
      );
//history cancel
  @POST("/api/seniors/history/delete")
  Future<CancelHistoryResponse> historyCancel(
      @Field("history_id") String historyId,
      );

//history update
  @POST("/api/seniors/history/update")
  Future<HistoryUpdateResponse> historyUpdate(
      @Field("history_category_id") String historyCategoryId,
      @Field("title") String title,
      @Field("description") String description,
      );
//history index
  @GET("/api/seniors/history")
  Future<HistoryIndexResponse> historyIndex();




//historyCategories create
  @POST("/api/seniors/history-categories/create")
  Future<HistoryCategoriesCreateResponse> historyCategoriesCreate(
      @Field("title") String title,
      @Field("description") String description,
      );
//historyCategories cancel
  @POST("/api/seniors/history-categories/delete")
  Future<CancelHistoryCategoriesResponse> historyCategoriesCancel(
      @Field("history_category_id") String historyCategoryId,
      );

//historyCategories update
  @POST("/api/seniors/history-categories/update")
  Future<HistoryCategoriesUpdateResponse> historyCategoriesUpdate(
      @Field("history_category_id") String historyCategoryId,
      @Field("title") String title,
      @Field("description") String description,
      );
//historyCategories index
  @GET("api/seniors/history-categories")
  Future<HistoryCategoriesIndexResponse> historyCategoriesIndex();




//medications create
  @POST("/api/seniors/medications/create")
  Future<MedicationsCreateResponse> medicationsCreate(
      @Field("medication") String medication,
      @Field("medication_dose") String medicationDose,
      );

//medications cancel
  @POST("/api/seniors/medications/delete")
  Future<CancelMedicationsResponse> medicationsCancel(
      @Field("medication_id") String medicationId,
      );

//medications update
  @POST("/api/seniors/medications/update")
  Future<MedicationsUpdateResponse> medicationsUpdate(
      @Field("medication_id") String medicationId,
      @Field("medication") String medication,
      @Field("medication_dose") String medicationDose,
      );
//medications index
  @GET("/api/seniors/medications")
  Future<MedicationsIndexResponse> medicationsIndex();

}
