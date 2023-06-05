import 'package:arsysfrontend/model/program.dart';
import 'package:arsysfrontend/model/student.dart';
import 'package:http/http.dart' as http;

class ProgramServices {
  String baseUrl = 'http://10.0.2.2:8000/api/program';

  Future<List<ProgramModel>> getProgram() async {
    var url = '$baseUrl/';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<ProgramModel> program = programModelFromJson(response.body);

      return program;
    } else {
      throw Exception('Get failed!');
    }
  }
}
