import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {

  static final SharedPref _sharedPref = new SharedPref._internal();

  SharedPref._internal();

  factory SharedPref() {
    return _sharedPref;
  }

  read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  save(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }


  saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}