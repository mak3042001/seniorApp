enum LanguageManager{arabic , english}
const String arabic = "ar";
const String english = "en";
extension LanguageManagerExtension on LanguageManager{
  String getLang(){
    switch(this){
      case LanguageManager.arabic:
        return arabic;
      case LanguageManager.english:
        return english;
    }
  }
}