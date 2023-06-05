import 'package:arsysfrontend/model/specialization_pivot.dart';
import 'package:arsysfrontend/services/SpecializationPivotServices.dart';
import 'package:flutter/material.dart';

class SpecializationPivotProvider extends ChangeNotifier {
  List<SpecializationPivotModel> _specializationPivot = [];

  List<SpecializationPivotModel> get specializationPivot =>
      _specializationPivot;

  set program(List<SpecializationPivotModel> specializationPivot) {
    _specializationPivot = specializationPivot;
    notifyListeners();
  }

  Future<void> getSpecializationPivot(int programId) async {
    try {
      List<SpecializationPivotModel> specializationPivot =
          await SpecializationPivotServices().getSpecializationPivot(programId);

      _specializationPivot = specializationPivot;
    } catch (e) {
      print(e);
    }
  }
}
