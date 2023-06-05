import 'package:arsysfrontend/model/supervisor.dart';
import 'package:flutter/material.dart';
import 'package:arsysfrontend/services/SupervisorServices.dart';

class SupervisorProvider extends ChangeNotifier {
  List<SupervisorModel> _supervisor = [];

  List<SupervisorModel> get supervisor => _supervisor;

  set supervisor(List<SupervisorModel> supervisor) {
    _supervisor = supervisor;
    notifyListeners();
  }

  Future<void> getSupervisor(String? abbrev) async {
    _supervisor.clear();
    notifyListeners();
    try {
      List<SupervisorModel> supervisor =
          await SupervisorServices().getSupervisor(abbrev);
      _supervisor = supervisor;
      print(supervisor.length);
    } catch (e) {
      print(e);
    }
  }
}
