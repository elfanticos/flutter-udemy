import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser {

  static final PreferencesUser _instance = new PreferencesUser._internal();

  factory PreferencesUser() {
    return _instance;
  }

  PreferencesUser._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get gender {
    return _prefs.getInt('gender') ?? 1;
  }

  set gender(int value) {
    _prefs.setInt('gender', value);
  }

  // get colorSecundary {
  //   return _prefs.getInt('colorSecundary') ?? true;
  // }

  // set colorSecundary(bool value) {
  //   _prefs.setBool('colorSecundary', value);
  // }

  // get name {
  //   return _prefs.getInt('name') ?? 'Pedro';
  // }

  // set name(String value) {
  //   _prefs.setString('name', value);
  // }


}