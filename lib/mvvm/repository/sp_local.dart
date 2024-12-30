import 'package:shared_preferences/shared_preferences.dart';

class LocalSharedPreferences {

  static const String isFirst = 'isFirst';


  final SharedPreferences _sharedPreferences;

  LocalSharedPreferences(this._sharedPreferences);

  Future<bool> setIsFirst(bool value) async => await _sharedPreferences.setBool(isFirst, value);

  bool getIsFirst() => _sharedPreferences.getBool(isFirst) ?? true;

}