import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:papered/widgets/categories_grid.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with AutomaticKeepAliveClientMixin {
  final Stream<QuerySnapshot> _categoryStream =
      FirebaseFirestore.instance.collection('categories').snapshots();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(30, 10, 0, 10),
            child: const Text(
              'Categories',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                StreamBuilder<QuerySnapshot>(
                    stream: _categoryStream,
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
                          gridDelegate: SliverStairedGridDelegate(
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              startCrossAxisDirectionReversed: true,
                              pattern: [
                                const StairedGridTile(0.5, 1),
                                const StairedGridTile(0.5, 3 / 4),
                                const StairedGridTile(1.0, 10 / 4),
                              ]),
                          physics: const BouncingScrollPhysics(),
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                          childrenDelegate: SliverChildBuilderDelegate(
                            childCount: snapshot.data!.docs.length,
                            (context, index) {
                              return CategoriesGrid(
                                category: snapshot.data!.docs[index],
                              );
                            },
                          ));
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
