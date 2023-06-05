import 'dart:convert';
import 'dart:math';

import 'package:arsysfrontend/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  TextEditingController ssoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void clear() {
    ssoController.text = "";
    passwordController.text = "";
    notifyListeners();
  }
}
