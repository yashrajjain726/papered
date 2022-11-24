import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

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
