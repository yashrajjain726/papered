import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:papered/providers/themestate.dart';
import 'package:papered/utils/utils.dart';
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
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                textColor: getcurrentThemeOppositeColor(context),
                iconColor: getcurrentThemeOppositeColor(context),
                selectedColor: getcurrentThemeColor(context),
                selectedTileColor: getcurrentThemeOppositeColor(context),
                tileColor: getcurrentThemeColor(context),
                leading: Icon(
                  themeModeIcons[index],
                ),
                title: Text(
                  themeModeText[index],
                  textAlign: TextAlign.start,
                ),
                selected: index == themeState.currentThemeIndex,
                onTap: () {
                  themeState.changeThemeMode(index);
                  Navigator.pop(context);
                },
              );
            }));
  }
}
