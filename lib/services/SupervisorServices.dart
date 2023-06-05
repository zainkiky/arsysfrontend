import 'package:arsysfrontend/model/supervisor.dart';
import 'package:http/http.dart' as http;

class SupervisorServices {
  String baseUrl = "http://10.0.2.2:8000/api/supervisor";

  Future<List<SupervisorModel>> getSupervisor(String? abbrev) async {
    var url = '$baseUrl?abbrev=${abbrev}';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<SupervisorModel> supervisor = supervisorModelFromJson(response.body);

      return supervisor;
    } else {
      throw Exception('Get failed!');
    }
  }
}
