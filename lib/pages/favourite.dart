import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:papered/providers/favoritestate.dart';
import 'package:papered/utils/preferences.dart';
import 'package:papered/widgets/image_grid.dart';
import 'package:papered/widgets/image_viewer.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

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
              style: NeumorphicStyle(
                  color: Theme.of(context).textTheme.overline!.color),
              textStyle: NeumorphicTextStyle(),
            )),
            body: favouriteProvider.favouriteList.isEmpty
                ? _noFavouriteContainer(context)
                : Column(
                    children: [
                      Expanded(
                        child: GridView.custom(
                          gridDelegate: SliverWovenGridDelegate.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                              pattern: const [
                                WovenGridTile(1),
                                WovenGridTile(
                                  5 / 7,
                                  crossAxisRatio: 0.9,
                                  alignment: AlignmentDirectional.centerEnd,
                                ),
                              ]),
                          childrenDelegate: SliverChildBuilderDelegate(
                              childCount: favouriteProvider
                                  .favouriteList.length, (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ImageViewer(
                                            image: favouriteProvider
                                                .favouriteList[index])));
                              },
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(30))),
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: favouriteProvider.favouriteList[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                          padding:
                              const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
                          controller: scrollController,
                        ),
                      )
                    ],
                  )));
  }

  _noFavouriteContainer(context) {
    return Center(
        child: NeumorphicText(
      "Currently, you have no favourites, click some hearts to add it here !!",
      textAlign: TextAlign.start,
      style:
          NeumorphicStyle(color: Theme.of(context).textTheme.overline!.color),
    ));
  }
}
