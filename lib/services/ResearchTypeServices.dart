import 'package:arsysfrontend/model/research_type.dart';
import 'package:http/http.dart' as http;

class ResearchTypeServices {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<ResearchTypeModel>> getResearchType() async {
    var url = '$baseUrl/research-type';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print(response.body);
      List<ResearchTypeModel> rType = researchTypeModelFromJson(response.body);

      return rType;
    } else {
      throw Exception('Get failed!');
    }
  }
}
