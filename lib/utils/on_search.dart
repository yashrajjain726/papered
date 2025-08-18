import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:papered/pages/search.dart';
import 'package:papered/providers/searchstate.dart';
import 'package:papered/utils/utils.dart';
import 'package:provider/provider.dart';

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
          Provider.of<SearchState>(context, listen: false).resetSearchData();
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Search(
      query: query,
      isFromCategoryPage: false,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
        child: NeumorphicText(
      "Search Image categories",
      textStyle: NeumorphicTextStyle(fontFamily: 'Orbitron'),
      textAlign: TextAlign.start,
      style:
          NeumorphicStyle(color: Theme.of(context).textTheme.labelSmall!.color),
    ));
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        hintColor: getcurrentThemeOppositeColor(context),
        textTheme: TextTheme(
            titleLarge:
                TextStyle(color: getcurrentThemeOppositeColor(context))),
        scaffoldBackgroundColor: getcurrentThemeColor(context),
        indicatorColor: getcurrentThemeOppositeColor(context),
        inputDecorationTheme: InputDecorationTheme(
            prefixIconColor: getcurrentThemeOppositeColor(context),
            suffixIconColor: getcurrentThemeOppositeColor(context)),
        textSelectionTheme: TextSelectionThemeData(
            selectionColor:
                getcurrentThemeOppositeColor(context).withValues(alpha: 0.5),
            selectionHandleColor: getcurrentThemeOppositeColor(context)),
        appBarTheme: AppBarTheme(
          titleTextStyle:
              TextStyle(color: getcurrentThemeOppositeColor(context)),
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: getcurrentThemeColor(context),
        ));
  }
}
