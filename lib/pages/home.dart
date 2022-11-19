import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:papered/widgets/image_grid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  final Stream<QuerySnapshot> _exploreStream =
      FirebaseFirestore.instance.collection('explore').snapshots();
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                StreamBuilder<QuerySnapshot>(
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
                      return StaggeredGridView.countBuilder(
                          padding:
                              const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0.0),
                          controller: controller,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 12,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, index) {
                            return ImageGrid(image: snapshot.data!.docs[index]);
                          },
                          staggeredTileBuilder: (index) {
                            return StaggeredTile.count(
                                1, index.isEven ? 1.0 : 1.8);
                          });
                    })
              ],
            ),
          ),
        ],
      )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
