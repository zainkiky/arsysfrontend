import 'dart:convert';

List<SpecializationPivotModel> specializationPivotModelFromJson(String str) =>
    List<SpecializationPivotModel>.from(json
        .decode(str)['data']
        .map((x) => SpecializationPivotModel.fromJson(x)));

String specializationPivotModelToJson(List<SpecializationPivotModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpecializationPivotModel {
  int id;
  int programId;
  int specializationId;
  DateTime createdAt;
  DateTime updatedAt;
  Specialization specialization;

  SpecializationPivotModel({
    required this.id,
    required this.programId,
    required this.specializationId,
    required this.createdAt,
    required this.updatedAt,
    required this.specialization,
  });

  factory SpecializationPivotModel.fromJson(Map<String, dynamic> json) =>
      SpecializationPivotModel(
        id: json["id"],
        programId: json["program_id"],
        specializationId: json["specialization_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        specialization: Specialization.fromJson(json["specialization"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "program_id": programId,
        "specialization_id": specializationId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "specialization": specialization.toJson(),
      };
}

class Specialization {
  int id;
  String abbrev;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  Specialization({
    required this.id,
    required this.abbrev,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) => Specialization(
        id: json["id"],
        abbrev: json["abbrev"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "abbrev": abbrev,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
