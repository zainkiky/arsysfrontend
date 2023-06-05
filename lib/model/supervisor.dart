import 'dart:convert';

List<SupervisorModel> supervisorModelFromJson(String str) =>
    List<SupervisorModel>.from(
        json.decode(str)['data'].map((x) => SupervisorModel.fromJson(x)));

String supervisorModelToJson(List<SupervisorModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SupervisorModel {
  int? id;
  String? nip;
  String? frontTitle;
  String? firstName;
  String? lastName;
  String? rearTitle;
  String? programDescription;
  String? specializationDescription;

  SupervisorModel({
    required this.id,
    required this.nip,
    required this.frontTitle,
    required this.firstName,
    required this.lastName,
    required this.rearTitle,
    required this.programDescription,
    required this.specializationDescription,
  });

  factory SupervisorModel.fromJson(Map<String, dynamic> json) =>
      SupervisorModel(
        id: json["id"],
        nip: json["nip"],
        frontTitle: json["front_title"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        rearTitle: json["rear_title"],
        programDescription: json["program_description"],
        specializationDescription: json["specialization_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "front_title": frontTitle,
        "first_name": firstName,
        "last_name": lastName,
        "rear_title": rearTitle,
        "program_description": programDescription,
        "specialization_description": specializationDescription,
      };
}
