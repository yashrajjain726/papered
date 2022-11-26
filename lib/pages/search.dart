import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:papered/models/imagemodel.dart';
import 'package:papered/providers/searchstate.dart';
import 'package:papered/services/api.dart';
import 'package:papered/widgets/image_grid.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  final query;
  const Search({super.key, required this.query});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late ScrollController _controller;
  List<Photos> myPhotos = [];
  @override
  void initState() {
    super.initState();
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
            myPhotos.add(element!);
          })
        // ignore: use_build_context_synchronously
        : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: NeumorphicText(
            'Search Keyword not valid',
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
    return Scaffold(
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
              childCount: myPhotos.length, (context, index) {
            return ImageGrid(data: myPhotos[index].src!.large2x);
          }),
          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
          controller: _controller,
        )),
      ],
    ));
  }
}
