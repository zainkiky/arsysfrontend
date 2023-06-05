import 'dart:convert';

import 'package:arsysfrontend/model/student.dart';
import 'package:http/http.dart' as http;

class StudentServices {
  String baseUrl = 'http://10.0.2.2:8000/api/student';

  Future<List<StudentModel>> getStudent(int programId, int specId) async {
    var url = '$baseUrl?program_id=$programId&specialization_id=$specId';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      List<StudentModel> student = studentModelFromJson(response.body);

      return student;
    } else {
      throw Exception('Get failed!');
    }
  }

  Future<int> getStudentCount() async {
    var url = '$baseUrl/count';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      int student = json.decode(response.body)['data'];
      return student;
    } else {
      throw Exception('Get failed!');
    }
  }

  Future<int> getStudentCountProgram(int programId) async {
    var url = '$baseUrl/count?program_id=$programId';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      int programCount = json.decode(response.body)['data'];

      return programCount;
    } else {
      throw Exception('Get failed!');
    }
  }

  Future<int> getStudentCountProgramSpecialization(
      int programId, int spcId) async {
    var url = '$baseUrl/count?program_id=$programId&specialization_id=$spcId';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      int programCount = json.decode(response.body)['data'];

      return programCount;
    } else {
      throw Exception('Get failed!');
    }
  }
}
