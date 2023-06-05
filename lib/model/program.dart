import 'dart:convert';

List<ProgramModel> programModelFromJson(String str) => List<ProgramModel>.from(
    json.decode(str)['data'].map((x) => ProgramModel.fromJson(x)));

String programModelToJson(List<ProgramModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProgramModel {
  int id;
  String? code;
  String? abbrev;
  String? description;
  dynamic descriptionEng;
  int? departmentId;
  DateTime? createdAt;
  DateTime? updatedAt;

  ProgramModel({
    required this.id,
    this.code,
    this.abbrev,
    this.description,
    this.descriptionEng,
    this.departmentId,
    this.createdAt,
    this.updatedAt,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
        id: json["id"],
        code: json["code"],
        abbrev: json["abbrev"],
        description: json["description"],
        descriptionEng: json["description_eng"],
        departmentId: json["department_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "abbrev": abbrev,
        "description": description,
        "description_eng": descriptionEng,
        "department_id": departmentId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
