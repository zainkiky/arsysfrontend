import 'package:arsysfrontend/model/research.dart';
import 'package:arsysfrontend/services/ResearchServices.dart';
import 'package:flutter/material.dart';

class ResearchProvider extends ChangeNotifier {
  bool _toggle = false;

  bool get toggle => _toggle;

  void onToggle() {
    _toggle = !toggle;
    print(toggle);
    notifyListeners();
  }

  List<ResearchModel> _research = [];

  List<ResearchModel> get research => _research;

  set research(List<ResearchModel> research) {
    _research = research;
    notifyListeners();
  }

  // int? _selectedItem;

  // int get selectedItem => _selectedItem!;

  // set selectedItem(int selectedItem) {
  //   _selectedItem = selectedItem;
  //   notifyListeners();
  // }

  // void isSelected(int index) {
  //   _selectedItem = index;
  //   print(index);
  //   print(_selectedItem);
  //   notifyListeners();
  // }

  Future<void> getresearch(String description) async {
    _research.clear();
    notifyListeners();
    try {
      List<ResearchModel> research =
          await ResearchServices().getresearch(description);
      _research = research;
      print(research.length);
    } catch (e) {
      print(e);
    }
  }
}
