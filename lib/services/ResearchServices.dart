import 'package:arsysfrontend/model/research.dart';
import 'package:http/http.dart' as http;

class ResearchServices {
  String baseUrl = "http://10.0.2.2:8000/api/research";

  Future<List<ResearchModel>> getresearch(String description) async {
    var url = '$baseUrl?description=$description';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<ResearchModel> research = researchModelFromJson(response.body);

      return research;
    } else {
      throw Exception('Get failed!');
    }
  }
}
