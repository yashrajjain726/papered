import 'package:flutter/material.dart';
import 'package:papered/utils/preferences.dart';

class FavoriteState extends ChangeNotifier {
  List<String> favouriteList = [];
  Preference preference = Preference();
  getFavouriteListUpdate() async {
    favouriteList = await preference.getFavoriteList();
    notifyListeners();
  }

  updateFavoriteList(String url) {
    if (favouriteList.contains(url)) {
      favouriteList.remove(url);
    } else {
      favouriteList.add(url);
    }
    notifyListeners();
  }

  bool checkIsFavoriteImage(image) {
    if (favouriteList.contains(image)) {
      return true;
    } else {
      return false;
    }
  }
}
