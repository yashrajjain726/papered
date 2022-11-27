import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:papered/providers/favoritestate.dart';
import 'package:papered/widgets/image_grid.dart';
import 'package:provider/provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    getFavoriteList();
    super.initState();
  }

  getFavoriteList() async {
    await Provider.of<FavoriteState>(context, listen: false)
        .getFavouriteListUpdate();
  }

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavoriteState>(context, listen: true);
    return SafeArea(
        child: Scaffold(
            appBar: NeumorphicAppBar(
                title: NeumorphicText(
              "Favourites",
              textStyle:
                  NeumorphicTextStyle(fontFamily: 'Orbitron', fontSize: 24),
              style: NeumorphicStyle(
                  color: Theme.of(context).textTheme.overline!.color),
            )),
            body: favouriteProvider.favouriteList.isEmpty
                ? _noFavouriteContainer(context)
                : Column(
                    children: [
                      Expanded(
                          child: GridView.custom(
                        gridDelegate: SliverQuiltedGridDelegate(
                            crossAxisCount: 4,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            repeatPattern: QuiltedGridRepeatPattern.inverted,
                            pattern: const [
                              QuiltedGridTile(2, 2),
                              QuiltedGridTile(1, 1),
                              QuiltedGridTile(1, 1),
                              QuiltedGridTile(1, 2),
                            ]),
                        childrenDelegate: SliverChildBuilderDelegate(
                            childCount: favouriteProvider.favouriteList.length,
                            (context, index) {
                          return ImageGrid(
                              data: favouriteProvider.favouriteList[index]);
                        }),
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
                        controller: scrollController,
                      ))
                    ],
                  )));
  }

  _noFavouriteContainer(context) {
    return Center(
        child: NeumorphicText(
      "Currently, you have no favourites 💔",
      textAlign: TextAlign.start,
      textStyle: NeumorphicTextStyle(fontFamily: 'Orbitron'),
      style:
          NeumorphicStyle(color: Theme.of(context).textTheme.overline!.color),
    ));
  }
}
