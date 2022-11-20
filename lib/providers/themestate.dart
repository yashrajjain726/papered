import 'package:flutter/material.dart';
import 'package:papered/utils/preferences.dart';

class ThemeState extends ChangeNotifier {
  int currentThemeIndex = 0;
  ThemeMode currentThemeMode = ThemeMode.light;
  final List<ThemeMode> _themeModes = [
    ThemeMode.light,
    ThemeMode.dark,
    ThemeMode.system
  ];
  void getTheme() async {
    currentThemeMode = _themeModes[currentThemeIndex];
    currentAccent = accentColors[currentAccentIndex];
    notifyListeners();
  }

  changeThemeMode(index) {
    currentThemeMode = _themeModes[index];
    currentThemeIndex = index;
    notifyListeners();
    Preference().saveThemeIndex(index);
  }

  ThemeData getDarkTheme() {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.black45,
      ),
      primaryColor: Colors.black45,
      colorScheme: const ColorScheme.dark().copyWith(secondary: currentAccent),
    );
  }

  // For Accent colors
  int currentAccentIndex = 0;
  List<Color> accentColors = [
    Colors.amber,
    Colors.purple,
    Colors.cyan,
    Colors.greenAccent,
    Colors.lime,
    Colors.redAccent
  ];
  List<Text> accentTexts = [
    const Text("Amber"),
    const Text("Purple"),
    const Text("Cyan"),
    const Text("Green Accent"),
    const Text("Lime"),
    const Text("Red Accent")
  ];
  Color currentAccent = Colors.amber;

  changeAccent(index) {
    currentAccent = accentColors[index];
    currentAccentIndex = index;
    notifyListeners();
    Preference().saveAccentIndex(index);
  }
}
