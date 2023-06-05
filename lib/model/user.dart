import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? sso;
  String? name;
  String? email;
  String? profilePhotoUrl;
  String? token;

  UserModel({
    required this.id,
    required this.sso,
    required this.name,
    required this.email,
    required this.profilePhotoUrl,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        sso: json["sso"],
        name: json["name"],
        email: json["email"],
        profilePhotoUrl: json["profile_photo_url"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sso": sso,
        "name": name,
        "email": email,
        "profile_photo_url": profilePhotoUrl,
        "token": token,
      };

  static List<UserModel> toJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((e) => UserModel.fromJson(e)).toList();
  }

  @override
  String toString() {
    return "($id, $sso, $name, $email, $profilePhotoUrl, $token)";
  }
}
