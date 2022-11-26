import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
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
  "Nature",
  "Beach",
  "Dark",
  "Black",
  "Beautiful",
  "Fish",
  "City",
  "Landscape",
  "Car",
  "Movie",
  "Models",
  "Actors"
];
List<CategoryModel> categories() {
  List<CategoryModel> myCategories = [];

  myCategories.add(CategoryModel(category[0],
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"));
  myCategories.add(CategoryModel(category[1],
      "https://images.pexels.com/photos/1680140/pexels-photo-1680140.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"));
  myCategories.add(CategoryModel(category[2],
      "https://images.pexels.com/photos/2449600/pexels-photo-2449600.png?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"));
  myCategories.add(CategoryModel(category[3],
      "https://images.pexels.com/photos/695644/pexels-photo-695644.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"));
  myCategories.add(CategoryModel(category[4],
      "https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"));
  myCategories.add(CategoryModel(category[5],
      "https://images.pexels.com/photos/2156311/pexels-photo-2156311.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"));
  myCategories.add(CategoryModel(category[6],
      "https://images.pexels.com/photos/2129796/pexels-photo-2129796.png?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"));
  myCategories.add(CategoryModel(category[7],
      "https://images.pexels.com/photos/167699/pexels-photo-167699.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"));
  myCategories.add(CategoryModel(category[8],
      "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"));
  myCategories.add(CategoryModel(category[9],
      "https://images.pexels.com/photos/4473634/pexels-photo-4473634.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"));
  myCategories.add(CategoryModel(category[10],
      "https://images.pexels.com/photos/160590/girls-beauty-makeup-dark-160590.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"));
  myCategories.add(CategoryModel(category[11],
      "https://images.pexels.com/photos/53370/cary-grant-rosalind-russell-ralph-bellamy-actor-53370.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"));

  return myCategories;
}
