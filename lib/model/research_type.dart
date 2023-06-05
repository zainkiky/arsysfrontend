import 'dart:convert';

List<ResearchTypeModel> researchTypeModelFromJson(String str) =>
    List<ResearchTypeModel>.from(
        json.decode(str)['data'].map((x) => ResearchTypeModel.fromJson(x)));

String researchTypeModelToJson(List<ResearchTypeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResearchTypeModel {
  int id;
  String code;
  String description;

  ResearchTypeModel({
    required this.id,
    required this.code,
    required this.description,
  });

  factory ResearchTypeModel.fromJson(Map<String, dynamic> json) =>
      ResearchTypeModel(
        id: json["id"],
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "description": description,
      };
}
