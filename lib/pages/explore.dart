import 'dart:math';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:papered/models/imagemodel.dart';
import 'package:papered/providers/categorystate.dart';
import 'package:papered/providers/explorestate.dart';
import 'package:papered/services/api.dart';
import 'package:papered/utils/on_search.dart';
import 'package:papered/utils/utils.dart';
import 'package:papered/widgets/image_grid.dart';
import 'package:papered/widgets/theme_dialog.dart';
import 'package:provider/provider.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with AutomaticKeepAliveClientMixin {
  ScrollController controller = ScrollController();
  final APIService apiService = APIService();

  @override
  void initState() {
    super.initState();
    var page = Provider.of<ExploreState>(context, listen: false).page;
    String category = getRandomCategory();

    controller = ScrollController(initialScrollOffset: 5.0)
      ..addListener(() {
        if (controller.offset >= controller.position.maxScrollExtent &&
            !controller.position.outOfRange) {
          Provider.of<ExploreState>(context, listen: false).updatePage(page++);
          getDataFromAPI(category);
        }
      });
    getDataFromAPI(category);
  }

  String getRandomCategory() {
    List<String> categoryList = [];
    categories().forEach((category) {
      categoryList.add(category.label);
    });
    int randomIndex = Random().nextInt(categoryList.length);
    return categoryList[randomIndex];
  }

  getDataFromAPI(category) async {
    var images = await apiService.getRandomWallpaper("20", category,
        Provider.of<ExploreState>(context, listen: false).page.toString());
    images.photos!.forEach((image) {
      Provider.of<ExploreState>(context, listen: false).addDatatoExplore(image);
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var exploreState = Provider.of<ExploreState>(context, listen: true);
    super.build(context);
    return SafeArea(
      child: Scaffold(
          appBar: NeumorphicAppBar(
            title: NeumorphicText(
              "Papered",
              textStyle:
                  NeumorphicTextStyle(fontFamily: 'Orbitron', fontSize: 24),
              style: NeumorphicStyle(
                  color: Theme.of(context).textTheme.overline!.color),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const ThemeDialog();
                      });
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: NeumorphicIcon(
                    Icons.brightness_4,
                    style: NeumorphicStyle(
                        color: Theme.of(context).iconTheme.color),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showSearch(context: context, delegate: OnSearch());
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: NeumorphicIcon(
                    Icons.search,
                    style: NeumorphicStyle(
                        color: Theme.of(context).iconTheme.color),
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
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
                    childCount: exploreState.data.length, (context, index) {
                  return ImageGrid(data: exploreState.data[index].src!.large2x);
                }),
                padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
                controller: controller,
              )),
            ],
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
