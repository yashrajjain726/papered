import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:papered/models/imagemodel.dart';
import 'package:papered/providers/searchstate.dart';
import 'package:papered/services/api.dart';
import 'package:papered/utils/utils.dart';
import 'package:papered/widgets/image_grid.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  final String query;
  final bool isFromCategoryPage;
  const Search(
      {super.key, required this.query, required this.isFromCategoryPage});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late ScrollController _controller;
  @override
  void initState() {
    super.initState();
    Provider.of<SearchState>(context, listen: false).resetSearchData();
    var page = Provider.of<SearchState>(context, listen: false).page;
    _controller = ScrollController(
      initialScrollOffset: 5,
    )..addListener(() {
        if (_controller.offset >= _controller.position.maxScrollExtent &&
            !_controller.position.outOfRange) {
          Provider.of<SearchState>(context, listen: false).updatePage(page++);
          fetchPhotosFromAPI(page);
        }
      });
    fetchPhotosFromAPI(page);
  }

  fetchPhotosFromAPI(page) async {
    var response = await APIService()
        .getRandomWallpaper("20", widget.query, page.toString());
    print(widget.query);
    response.photos!.isNotEmpty
        ? response.photos!.forEach((element) {
            Provider.of<SearchState>(context, listen: false)
                .addSearchedDataResult(element);
          })
        : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: NeumorphicText(
            'Search Keyword not valid',
            style: NeumorphicStyle(color: getcurrentThemeColor(context)),
            textStyle: NeumorphicTextStyle(
              fontFamily: 'Orbitron',
            ),
          )));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var searchProvider = Provider.of<SearchState>(context, listen: true);
    return SafeArea(
      child: Scaffold(
          appBar: widget.isFromCategoryPage
              ? NeumorphicAppBar(
                  title: NeumorphicText(
                  widget.query,
                  textStyle:
                      NeumorphicTextStyle(fontFamily: 'Orbitron', fontSize: 24),
                  style: NeumorphicStyle(
                      color: Theme.of(context).textTheme.overline!.color),
                ))
              : null,
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
                    childCount: searchProvider.data.length, (context, index) {
                  return ImageGrid(
                      data: searchProvider.data[index].src!.large2x);
                }),
                padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
                controller: _controller,
              )),
            ],
          )),
    );
  }
}
