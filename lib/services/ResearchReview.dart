import 'package:arsysfrontend/model/research_review.dart';
import 'package:arsysfrontend/model/research_type.dart';
import 'package:http/http.dart' as http;

class ResearchReviewServices {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<ResearchReviewModel>> getResearchReview(int researchId) async {
    var url = '$baseUrl/research-review?research_id=${researchId}';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<ResearchReviewModel> rReview =
          researchReviewModelFromJson(response.body);

      return rReview;
    } else {
      throw Exception('Get failed!');
    }
  }
}
