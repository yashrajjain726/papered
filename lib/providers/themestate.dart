import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
    notifyListeners();
  }

  changeThemeMode(index) {
    currentThemeMode = _themeModes[index];
    currentThemeIndex = index;
    notifyListeners();
    Preference().saveThemeIndex(index);
  }

  NeumorphicThemeData getDarkTheme() {
    return const NeumorphicThemeData(
      baseColor: Colors.black,
      depth: 8,
      defaultTextColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.white),
      appBarTheme: NeumorphicAppBarThemeData(
        iconTheme: IconThemeData(color: Colors.white),
      ),
      accentColor: Colors.black,
    );
  }
}
