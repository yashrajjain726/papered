import 'package:flutter/material.dart';
import 'package:papered/models/categorymodel.dart';

class CategoryState extends ChangeNotifier {
  List<CategoryModel> data = [];
  getCategories() {
    return data;
  }

  updateCategoriesList(List<CategoryModel> list) {
    data = list;
    notifyListeners();
  }

  addCategoryToList(CategoryModel link) {
    data.add(link);
    notifyListeners();
  }
}
