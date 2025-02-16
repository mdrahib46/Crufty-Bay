import 'dart:convert';
import 'package:cruftybay/features/auth/data/model/sign_in_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static const  String _accessTokenKey = 'access-token';
  static const  _profileDataKey = 'access-token';

  static String? accessToken;
  static User? profileModel;


  static Future<void> saveAccessToken(String token) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    accessToken = token;
  }

  static Future<String?> getAccessToken()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
    accessToken = token;
    return token;
  }
  Future<void> saveUserData(String accessToken, User userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, accessToken);
    await sharedPreferences.setString(
        _profileDataKey, jsonEncode(userModel.toJson()));
    profileModel = userModel;
  }

  Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString(_accessTokenKey);
    profileModel = User.fromJson(
      jsonDecode(sharedPreferences.getString(_profileDataKey)!),
    );
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_accessTokenKey);
    if (token != null) {
      await getUserData();
      return true;
    }
    return false;
  }

  Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}