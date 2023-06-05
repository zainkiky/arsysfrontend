import 'package:arsysfrontend/model/user.dart';
import 'package:flutter/material.dart';
import 'package:arsysfrontend/services/AuthServices.dart';

class AuthProvider with ChangeNotifier {
  bool _toggle = true;

  bool get toggle => _toggle;

  void onToggle() {
    _toggle = !toggle;
    print(toggle);
    notifyListeners();
  }

  bool _toggle1 = true;

  bool get toggle1 => _toggle1;

  void onToggle1() {
    _toggle1 = !toggle1;
    print(toggle1);
    notifyListeners();
  }

  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String? sso,
    String? name,
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        sso: sso,
        name: name,
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String? sso,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        sso: sso!,
        password: password!,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> logout(String token, BuildContext context) async {
    try {
      if (await AuthService().logout(token)) {
        _user.token = "";
        Navigator.pushNamedAndRemoveUntil(
            context, '/signin_page', (route) => false);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> update({
    String? name,
    String? email,
    String? token,
  }) async {
    try {
      UserModel user = await AuthService().update(
        name: name,
        email: email,
        token: token,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
