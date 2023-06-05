import 'dart:convert';

List<ResearchModel> researchModelFromJson(String str) =>
    List<ResearchModel>.from(
        json.decode(str)['data'].map((x) => ResearchModel.fromJson(x)));

String researchModelToJson(List<ResearchModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResearchModel {
  int id;
  Description description;
  String researchCode;
  String title;
  String? researchId;
  String firstName;
  String lastName;
  String code;

  ResearchModel({
    required this.id,
    required this.description,
    required this.researchCode,
    required this.title,
    this.researchId,
    required this.firstName,
    required this.lastName,
    required this.code,
  });

  factory ResearchModel.fromJson(Map<String, dynamic> json) => ResearchModel(
        id: json["id"],
        description: descriptionValues.map[json["description"]]!,
        researchCode: json["research_code"],
        title: json["title"],
        researchId: json["research_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": descriptionValues.reverse[description],
        "research_code": researchCode,
        "title": title,
        "research_id": researchId,
        "first_name": firstName,
        "last_name": lastName,
        "code": code,
      };
}

enum Description {
  TUGAS_AKHIR,
  SKRIPSI,
  SEMINAR_TEKNIK_ELEKTRO,
  PRAKTIK_INDUSTRI
}

final descriptionValues = EnumValues({
  "Praktik Industri": Description.PRAKTIK_INDUSTRI,
  "Seminar Teknik Elektro": Description.SEMINAR_TEKNIK_ELEKTRO,
  "Skripsi": Description.SKRIPSI,
  "Tugas Akhir": Description.TUGAS_AKHIR
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
