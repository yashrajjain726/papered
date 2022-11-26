import 'package:flutter/material.dart';
import 'package:papered/models/imagemodel.dart';

class SearchState extends ChangeNotifier {
  List<Photos> data = [];
  int page = 1;

  updatePage(int number) {
    page = number;
    notifyListeners();
  }
}
