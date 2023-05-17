import 'package:senior/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

String prefKey="prefKeyLang";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";
class AppPreference{

  final SharedPreferences _sharedPreferences;

  AppPreference(this._sharedPreferences);

  Future<String> getLanguage() async {
    String? language = _sharedPreferences.getString(prefKey);

    if(language != null && language.isNotEmpty){
      return language;
    }else{
      return LanguageManager.english.getLang();
    }
  }

  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }
}