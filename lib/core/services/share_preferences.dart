import 'package:shared_preferences/shared_preferences.dart';

class Sharedprefs {
   static String nameKey = "name";
   static String imageKey = "image";
   static late SharedPreferences prefs;
   static Future<void> init() async {
   prefs = await SharedPreferences.getInstance();
  }

  static Future<void> informdata(String name, String image) async {
    await setString(nameKey, name);
    await setString(imageKey, image);
  }

  static Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  static String getString(String key) {
    return prefs.getString(key) ?? "";
  }
}
