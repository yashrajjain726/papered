import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

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
