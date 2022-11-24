import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Search extends StatefulWidget {
  final query;
  const Search({super.key, required this.query});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: NeumorphicText(
        "Search",
        textAlign: TextAlign.start,
        style:
            NeumorphicStyle(color: Theme.of(context).textTheme.overline!.color),
      )),
    );
  }
}
