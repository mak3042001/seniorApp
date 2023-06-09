import 'package:senior/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

String prefKey="prefKeyLang";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";
const String PREFS_KEY_USER_Token = "PREFS_KEY_USER_Token";
const String PREFS_KEY_Booking_Date = "PREFS_KEY_Booking_Date";
const String PREFS_KEY_USER_Id = "PREFS_KEY_USER_Id";
const String PREFS_KEY_HistoryCategoryId_Id = "PREFS_KEY_HistoryCategoryId_Id";
class AppPreference{

  final SharedPreferences sharedPreferences;

  AppPreference(this.sharedPreferences);

  Future<String> getLanguage() async {
    String? language = sharedPreferences.getString(prefKey);

    if(language != null && language.isNotEmpty){
      return language;
    }else{
      return LanguageManager.english.getLang();
    }
  }

  Future<void> setUserLoggedIn() async {
    sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future<void> setUserLoggedOut() async {
    sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
  }

  Future<void> setUserToken(token) async {
    sharedPreferences.setString(PREFS_KEY_USER_Token, token);
  }

  Future<String> getUserToken() async {
    return sharedPreferences.getString(PREFS_KEY_USER_Token) ?? "";
  }

  Future<void> setUserId(id) async {
    sharedPreferences.setInt(PREFS_KEY_USER_Id, id);
  }

  Future<int> getUserId() async {
    return sharedPreferences.getInt(PREFS_KEY_USER_Id) ?? 0;
  }

  Future<void> setHistoryCategoryId(historyCategoryId) async {
    sharedPreferences.setInt(PREFS_KEY_HistoryCategoryId_Id, historyCategoryId);
  }

  Future<int> getHistoryCategoryId() async {
    return sharedPreferences.getInt(PREFS_KEY_HistoryCategoryId_Id) ?? 0;
  }

  Future<void> setBookingDate(date) async {
    sharedPreferences.setString(PREFS_KEY_Booking_Date, date);
  }

  Future<String> getBookingDate() async {
    return sharedPreferences.getString(PREFS_KEY_Booking_Date) ?? "";
  }
}


