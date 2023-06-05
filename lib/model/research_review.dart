import 'dart:convert';

List<ResearchReviewModel> researchReviewModelFromJson(String str) =>
    List<ResearchReviewModel>.from(
        json.decode(str)['data'].map((x) => ResearchReviewModel.fromJson(x)));

String researchReviewModelToJson(List<ResearchReviewModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ResearchReviewModel {
  int researchId;
  int supervisorId;
  String nip;
  String frontTitle;
  String firstName;
  String lastName;
  String rearTitle;

  ResearchReviewModel({
    required this.researchId,
    required this.supervisorId,
    required this.nip,
    required this.frontTitle,
    required this.firstName,
    required this.lastName,
    required this.rearTitle,
  });

  factory ResearchReviewModel.fromJson(Map<String, dynamic> json) =>
      ResearchReviewModel(
        researchId: json["research_id"],
        supervisorId: json["supervisor_id"],
        nip: json["nip"],
        frontTitle: json["front_title"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        rearTitle: json["rear_title"],
      );

  Map<String, dynamic> toJson() => {
        "research_id": researchId,
        "supervisor_id": supervisorId,
        "nip": nip,
        "front_title": frontTitle,
        "first_name": firstName,
        "last_name": lastName,
        "rear_title": rearTitle,
      };
}
