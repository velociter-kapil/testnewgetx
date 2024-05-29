import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {

  static String key_login = "Logindata";

  static String base_url = "https://dev.totalytics.in";
  static String middle_point = "/backendApi/";

  static String Register_user = base_url+middle_point+"demo/registernew";
  static String login_user = base_url+middle_point+"demo/loginnew";
  static String getalluser = base_url+middle_point+"demo/getalluser";

  static Future saveLogin(String loginjson) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(key_login, loginjson);
  }
  static Future<String?> getLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? data_id = sharedPreferences.getString(key_login);
    return data_id;
  }
  static Future removeLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key_login);
  }
}