import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefrencesService {
  static late SharedPreferences prefs;
  static Future<void> initSharedPrefrences() async {
    prefs = await SharedPreferences.getInstance();
  }
}
