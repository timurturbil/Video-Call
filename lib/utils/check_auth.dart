/* import 'package:shared_preferences/shared_preferences.dart';

class CheckAuth {
  static Future<bool> isLogged() async {
    final sp = await SharedPreferences.getInstance();
    final apiKey = sp.getString("token");
    if (apiKey != null) {
      return true;
    } else {
      return false;
    }
  }
}
 */