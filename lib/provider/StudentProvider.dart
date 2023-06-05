import 'package:arsysfrontend/model/student.dart';
import 'package:arsysfrontend/services/StudentServices.dart';
import 'package:flutter/material.dart';
import 'package:arsysfrontend/provider/ProgramProvider.dart';

class StudentProvider extends ChangeNotifier {
  List<StudentModel> _student = [];

  List<StudentModel> get student => _student;

  set student(List<StudentModel> student) {
    _student = student;
    notifyListeners();
  }

  int? _studentCount;

  int get studentCount => _studentCount!;

  set studentCount(int studentCount) {
    _studentCount = studentCount;
    notifyListeners();
  }

  List studentCountProgramList = [];

  List studentCountProgramSpList = [];

  Future<void> getStudent(int programId, int specId) async {
    _student.clear();
    notifyListeners();
    try {
      List<StudentModel> student =
          await StudentServices().getStudent(programId, specId);
      _student = student;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getStudentCount() async {
    try {
      int studentCount = await StudentServices().getStudentCount();
      _studentCount = studentCount;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getStudentCountProgram(int length) async {
    try {
      studentCountProgramList.clear();
      for (var i = 1; i <= length; i++) {
        int a = await StudentServices().getStudentCountProgram(i);
        studentCountProgramList.add(a);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getStudentCountProgramSpecialization(
      int length, int programId) async {
    try {
      studentCountProgramSpList.clear();
      for (var i = 1; i <= length; i++) {
        int a = await StudentServices()
            .getStudentCountProgramSpecialization(programId, i);
        studentCountProgramSpList.add(a);
      }
    } catch (e) {
      print(e);
    }
  }
}
