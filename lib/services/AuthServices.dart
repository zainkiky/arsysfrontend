import 'dart:convert';

import 'package:arsysfrontend/model/user.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<UserModel> register({
    String? sso,
    String? name,
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'sso': sso,
      'name': name,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Register failed');
    }
  }

  Future<UserModel> login({
    String? sso,
    String? password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'sso': sso,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<bool> logout(
    String? token,
  ) async {
    var url = '$baseUrl/logout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': '${token}',
    };

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
    );

    print(response.statusCode);

    if (response.statusCode == 200) {
      print("Token removed");
      return true;
    } else {
      throw Exception('Gagal Logout');
    }
  }

  Future<UserModel> update({
    String? name,
    String? email,
    String? token,
  }) async {
    var url = '$baseUrl/user';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': '${token}',
    };
    var body = jsonEncode({
      'name': name,
      'email': email,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(jsonDecode(response.body)['data']);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Update failed');
    }
  }
}
