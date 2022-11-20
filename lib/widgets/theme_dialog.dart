import 'package:flutter/material.dart';
import 'package:papered/providers/themestate.dart';
import 'package:provider/provider.dart';

class ThemeDialog extends StatefulWidget {
  const ThemeDialog({super.key});

  @override
  State<ThemeDialog> createState() => _ThemeDialogState();
}

class _ThemeDialogState extends State<ThemeDialog> {
  final List<IconData> themeModeIcons = [
    Icons.light_mode,
    Icons.dark_mode,
    Icons.memory
  ];
  final List<String> themeModeText = ["Light", "Dark", "System"];
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<ThemeState>(context);
    return Dialog(
        child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTileTheme(
                selectedColor: Theme.of(context).accentColor,
                child: ListTile(
                  leading: Icon(themeModeIcons[index]),
                  title: Text(themeModeText[index]),
                  selected: index == themeState.currentThemeIndex,
                  onTap: () {
                    themeState.changeThemeMode(index);
                    Navigator.pop(context);
                  },
                ),
              );
            }));
  }
}
