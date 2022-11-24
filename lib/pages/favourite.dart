import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: NeumorphicText(
        "Favourties",
        textAlign: TextAlign.start,
        style:
            NeumorphicStyle(color: Theme.of(context).textTheme.overline!.color),
      )),
    ));
  }
}
