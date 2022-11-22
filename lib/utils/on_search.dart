import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:papered/pages/search.dart';

class OnSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          padding: const EdgeInsets.all(15),
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        padding: const EdgeInsets.all(15),
        onPressed: () {
          close(context, "result");
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Search(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text("Search Image categories"));
  }
}
