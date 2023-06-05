import 'package:arsysfrontend/model/research_type.dart';
import 'package:arsysfrontend/services/ResearchTypeServices.dart';
import 'package:flutter/material.dart';

class ResearchTypeProvider extends ChangeNotifier {
  List<ResearchTypeModel> _rType = [];

  List<ResearchTypeModel> get rType => _rType;

  set rType(List<ResearchTypeModel> rType) {
    _rType = rType;
    notifyListeners();
  }

  Future<void> getResearchType() async {
    try {
      List<ResearchTypeModel> rType =
          await ResearchTypeServices().getResearchType();
      _rType = rType;
    } catch (e) {
      print(e);
    }
  }
}
