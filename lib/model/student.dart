// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

List<StudentModel> studentModelFromJson(String str) => List<StudentModel>.from(
    json.decode(str)['data'].map((x) => StudentModel.fromJson(x)));

String studentModelToJson(List<StudentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentModel {
  int? id;
  String? firstName;
  String? lastName;
  String? code;
  String? programDescription;
  String? specializationDescription;
  String? frontTitle;
  String? rearTitle;
  String? supervisorFirstName;
  String? supervisorLastName;

  StudentModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.code,
    required this.programDescription,
    required this.specializationDescription,
    required this.frontTitle,
    required this.rearTitle,
    required this.supervisorFirstName,
    required this.supervisorLastName,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        code: json["code"],
        programDescription: json["program_description"],
        specializationDescription: json["specialization_description"],
        frontTitle: json["front_title"],
        rearTitle: json["rear_title"],
        supervisorFirstName: json["supervisor_first_name"],
        supervisorLastName: json["supervisor_last_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "code": code,
        "program_description": programDescription,
        "specialization_description": specializationDescription,
        "front_title": frontTitle,
        "rear_title": rearTitle,
        "supervisor_first_name": supervisorFirstName,
        "supervisor_last_name": supervisorLastName,
      };
}
