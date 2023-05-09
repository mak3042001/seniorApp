import 'package:senior/presentation/resource/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

String prefKey="prefKeyLang";
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
}