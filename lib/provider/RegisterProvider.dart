import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  TextEditingController ssoController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void clear() {
    ssoController.text = "";
    nameController.text = "";
    emailController.text = "";
    passwordController.text = "";
    notifyListeners();
  }
}
