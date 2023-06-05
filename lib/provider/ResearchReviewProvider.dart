import 'package:arsysfrontend/model/research_review.dart';
import 'package:arsysfrontend/services/ResearchReview.dart';
import 'package:flutter/material.dart';

class ResearchReviewProvider extends ChangeNotifier {
  List<ResearchReviewModel> _rReview = [];

  List<ResearchReviewModel> get rReview => _rReview;

  set rReview(List<ResearchReviewModel> rReview) {
    _rReview = rReview;
    notifyListeners();
  }

  Future<void> getResearchReview(int researchId) async {
    _rReview.clear();
    notifyListeners();

    try {
      List<ResearchReviewModel> rReview =
          await ResearchReviewServices().getResearchReview(researchId);
      _rReview = rReview;
    } catch (e) {
      print(e);
    }
  }
}
