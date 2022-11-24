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
                child: StreamBuilder<QuerySnapshot>(
                    stream: _exploreStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: NeumorphicText(
                            "Something Went Wrong !!",
                            textAlign: TextAlign.start,
                            textStyle:
                                NeumorphicTextStyle(fontFamily: 'Orbitron'),
                            style: NeumorphicStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .overline!
                                    .color),
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return GridView.custom(
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
                            childCount: snapshot.data!.docs.length,
                            (context, index) {
                          return ImageGrid(
                              data: snapshot.data!.docs[index]['bg_img']);
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
