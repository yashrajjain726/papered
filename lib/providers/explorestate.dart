import 'package:flutter/material.dart';
import 'package:papered/models/imagemodel.dart';

class ExploreState extends ChangeNotifier {
  List<Photos> data = [];
  int page = 1;
  getExploreData() {
    return data;
  }

  updateExploreData(List<Photos> list) {
    data = list;
    notifyListeners();
  }

  addDatatoExplore(Photos? link) {
    data.add(link!);
    notifyListeners();
  }

  updatePage(int number) {
    page = number;
    notifyListeners();
  }

  getPage() {
    return page;
  }
}
