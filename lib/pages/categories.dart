import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:papered/models/categorymodel.dart';
import 'package:papered/pages/search.dart';
import 'package:papered/providers/categorystate.dart';
import 'package:papered/services/api.dart';
import 'package:papered/utils/utils.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories>
    with AutomaticKeepAliveClientMixin {
  final APIService apiService = APIService();
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryState>(context, listen: false)
        .updateCategoriesList(categories());
  }

  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryState>(context, listen: true);
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
                      GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 3.6,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 4,
                          ),
                          itemCount: categoryProvider.data.length,
                          itemBuilder: (context, index) {
                            return Neumorphic(
                                margin: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                                style: NeumorphicStyle(
                                    boxShape: NeumorphicBoxShape.roundRect(
                                        BorderRadius.circular(20))),
                                child: InkWell(
                                  onTap: () {
                                    print("istapperd");
                                    MaterialPageRoute(
                                        builder: (context) => Search(
                                            query: categoryProvider
                                                .data[index].label));
                                  },
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: CachedNetworkImageProvider(
                                                categoryProvider
                                                    .data[index].imageUrl),
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
                                        categoryProvider.data[index].label,
                                        style: const NeumorphicStyle(
                                          color: Colors.white,
                                        ),
                                        textStyle: NeumorphicTextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Orbitron'),
                                      )
                                    ],
                                  ),
                                ));
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
