import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/auth_model.dart';
import 'package:shop_app/providers/auth.dart';

class InternalStorageServices {
  static Future<AuthModel> loadInternalStorage() async {
    final instance = await SharedPreferences.getInstance();

    if (instance.containsKey(Auth.key)) {
      String userJson = instance.getString(Auth.key)!;
      return AuthModel.fromJson(userJson);
    }
    return AuthModel(token: '', userId: '');
  }

  static Future setUser(String user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(
      Auth.key,
      user,
    );
  }

  static Future cleanUser() async {
    final instance = await SharedPreferences.getInstance();
    await instance.remove(Auth.key);
  }
}
