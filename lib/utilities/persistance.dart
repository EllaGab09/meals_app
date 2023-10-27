import 'package:shared_preferences/shared_preferences.dart';
// Source https://github.com/ThomasFSynnes/Meals_App/tree/main/lib/utils

class PersistFavorites {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  addRating(String key, int value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt(key, value);
  }

  Future getRating(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(key);
  }
}
