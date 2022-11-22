import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:papered/providers/themestate.dart';
import 'package:papered/utils/on_search.dart';
import 'package:papered/widgets/image_grid.dart';
import 'package:papered/widgets/theme_dialog.dart';
import 'package:provider/provider.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with AutomaticKeepAliveClientMixin {
  final Stream<QuerySnapshot> _exploreStream =
      FirebaseFirestore.instance.collection('explore').snapshots();
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var themeState = Provider.of<ThemeState>(context);
    super.build(context);
    return SafeArea(
      child: Scaffold(
          floatingActionButton: NeumorphicButton(
            padding: const EdgeInsets.all(15),
            style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
            onPressed: () {
              showSearch(context: context, delegate: OnSearch());
            },
            child: const Icon(Icons.search),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NeumorphicButton(
                padding: const EdgeInsets.all(15),
                style: const NeumorphicStyle(
                    boxShape: NeumorphicBoxShape.circle()),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const ThemeDialog();
                      });
                },
                child: NeumorphicButton(
                  padding: EdgeInsets.zero,
                  child: const Icon(
                    Icons.brightness_4,
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: _exploreStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text("Something Went Wrong"),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return GridView.custom(
                        gridDelegate: SliverQuiltedGridDelegate(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 12,
                            repeatPattern: QuiltedGridRepeatPattern.inverted,
                            pattern: const [
                              QuiltedGridTile(2, 2),
                              QuiltedGridTile(1, 1),
                              QuiltedGridTile(1, 1),
                              QuiltedGridTile(1, 2),
                            ]),
                        childrenDelegate: SliverChildBuilderDelegate(
                            childCount: snapshot.data!.docs.length,
                            (context, index) {
                          return ImageGrid(data: snapshot.data!.docs[index]);
                        }),
                        padding:
                            const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
                        controller: controller,
                      );
                    }),
              ),
            ],
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
