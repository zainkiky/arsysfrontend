import 'package:arsysfrontend/model/specialization_pivot.dart';
import 'package:http/http.dart' as http;

class SpecializationPivotServices {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<SpecializationPivotModel>> getSpecializationPivot(
      int programId) async {
    var url = '$baseUrl/pivot?program_id=$programId';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<SpecializationPivotModel> specialization =
          specializationPivotModelFromJson(response.body);

      return specialization;
    } else {
      throw Exception('Get failed!');
    }
  }
}
