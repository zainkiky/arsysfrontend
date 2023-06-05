import 'dart:convert';

import 'package:arsysfrontend/model/program.dart';
import 'package:arsysfrontend/services/ProgramServices.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProgramProvider extends ChangeNotifier {
  List<ProgramModel> _program = [];

  List<ProgramModel> get program => _program;

  set program(List<ProgramModel> program) {
    _program = program;
    notifyListeners();
  }

  Future<void> getProgram() async {
    try {
      List<ProgramModel> program = await ProgramServices().getProgram();
      _program = program;
      print(program);
    } catch (e) {
      print(e);
    }
  }
}
