import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:papered/models/categorymodel.dart';

const platform = MethodChannel('com.yashrajjaiin.papered/gallery');

Color getcurrentThemeColor(BuildContext context) {
  if (NeumorphicTheme.isUsingDark(context)) {
    return Colors.black;
  } else {
    return Colors.white;
  }
}

Color getcurrentThemeOppositeColor(BuildContext context) {
  if (NeumorphicTheme.isUsingDark(context)) {
    return Colors.white;
  } else {
    return Colors.black;
  }
}

var category = [
  "Abstract",
  "Animals",
  "Art",
  "Computer",
  "Films",
  "Landscape",
  "Light",
  "Minimal",
  "Sketched",
  "Nature",
  "Beach",
  "Dark",
  "Black",
  "Beautiful",
  "Fish",
  "City",
  "Car",
  "Movie",
  "Models",
  "Actors"
];
List<CategoryModel> categories() {
  List<CategoryModel> myCategories = [];

  myCategories.add(CategoryModel(category[0], "assets/images/abstract.jpeg"));
  myCategories.add(CategoryModel(category[1], "assets/images/animals.jpeg"));
  myCategories.add(CategoryModel(category[2], "assets/images/art.jpeg"));
  myCategories.add(CategoryModel(category[3], "assets/images/computer.jpeg"));
  myCategories.add(CategoryModel(category[4], "assets/images/films.jpeg"));
  myCategories.add(CategoryModel(category[5], "assets/images/landscape.jpeg"));
  myCategories.add(CategoryModel(category[6], "assets/images/light.jpeg"));
  myCategories.add(CategoryModel(category[7], "assets/images/minimal.jpeg"));
  myCategories.add(CategoryModel(category[8], "assets/images/sketched.jpeg"));
  myCategories.add(CategoryModel(category[9], "assets/images/nature.jpeg"));
  myCategories.add(CategoryModel(category[10], "assets/images/beach.jpeg"));
  myCategories.add(CategoryModel(category[11], "assets/images/dark.jpeg"));
  myCategories.add(CategoryModel(category[12], "assets/images/black.jpeg"));
  myCategories.add(CategoryModel(category[13], "assets/images/beautiful.jpeg"));
  myCategories.add(CategoryModel(category[14], "assets/images/fish.jpeg"));
  myCategories.add(CategoryModel(category[15], "assets/images/city.jpeg"));
  myCategories.add(CategoryModel(category[16], "assets/images/car.jpeg"));
  myCategories.add(CategoryModel(category[17], "assets/images/movie.jpeg"));
  myCategories.add(CategoryModel(category[18], "assets/images/models.jpeg"));
  myCategories.add(CategoryModel(category[19], "assets/images/actors.jpeg"));
  return myCategories;
}
