import 'package:shared_preferences/shared_preferences.dart';

/// Generic class to do shared preferences
/// management with dynamic data type
class SharedManager<T> {

  /// Instance shared preferences
  /// and make it private
  late SharedPreferences _prefs;
  /// Get type of this generic class
  Type types<U>() => T;
  
  /// Call the shared preferences
  /// field using keyname and with 
  /// the generic return type
  Future<T?> read(String key) async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.get(key) as T?;
  }

  /// This function will set value
  /// into shared preferences
  Future store(String key, dynamic value) async {
    _prefs = await SharedPreferences.getInstance();
    var type = types<T>();
    switch(type) {
      case String:
        _prefs.setString(key, value);
        break;
      case int:
        _prefs.setInt(key, value);
        break;
      case bool:
        _prefs.setBool(key, value);
        break;
      case double:
        _prefs.setDouble(key, value);
        break;
      case List:
        _prefs.setStringList(key, value);
        break;
    }
  }

  /// Clear all stored shared preferences
  Future clear() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
  }

  Future remove(String key) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.remove(key);
  }
}