import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void clear() {
    nameController.text = "";
    emailController.text = "";
    notifyListeners();
  }
}
