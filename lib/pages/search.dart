import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final query;
  const Search({super.key, required this.query});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Search")),
    );
  }
}
