import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
            appBar: NeumorphicAppBar(
                title: NeumorphicText(
              "Categories",
              textStyle:
                  NeumorphicTextStyle(fontFamily: 'Orbitron', fontSize: 24),
              style: NeumorphicStyle(
                  color: Theme.of(context).textTheme.overline!.color),
            )),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      StreamBuilder<QuerySnapshot>(
                          stream: _categoryStream,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: NeumorphicText(
                                  "Something went Wrong !!",
                                  textAlign: TextAlign.start,
                                  textStyle: NeumorphicTextStyle(
                                      fontFamily: 'Orbitron'),
                                  style: NeumorphicStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .overline!
                                          .color),
                                ),
                              );
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  childAspectRatio: 3.6,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 4,
                                ),
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  return Neumorphic(
                                      margin: const EdgeInsets.fromLTRB(
                                          10, 2, 10, 2),
                                      style: NeumorphicStyle(
                                          boxShape:
                                              NeumorphicBoxShape.roundRect(
                                                  BorderRadius.circular(20))),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    CachedNetworkImageProvider(
                                                        snapshot.data!
                                                                .docs[index]
                                                            ['bg_img']),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.transparent
                                                    .withOpacity(0.6)),
                                          ),
                                          NeumorphicText(
                                            snapshot.data!.docs[index]
                                                ['category_type'],
                                            style: const NeumorphicStyle(
                                              color: Colors.white,
                                            ),
                                            textStyle: NeumorphicTextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Orbitron'),
                                          )
                                        ],
                                      ));
                                });
                          })
                    ],
                  ),
                ),
              ],
            )));
  }

  @override
  bool get wantKeepAlive => true;
}
