import 'package:shared_preferences/shared_preferences.dart';

class MyPreferences {
  Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  void setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<int?> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  void setInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  void removePrefs(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

}
























