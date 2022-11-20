import 'package:flutter/material.dart';
import 'package:papered/pages/search.dart';

class OnSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
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
