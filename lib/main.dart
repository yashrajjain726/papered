import 'package:flutter/material.dart';
import 'package:papered/pages/categories.dart';
import 'package:papered/pages/favourite.dart';
import 'package:papered/pages/home.dart';
import 'package:papered/pages/search.dart';
import 'package:papered/providers/pagestate.dart';
import 'package:papered/widgets/bottom_navigation_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> pages = [Home(), Search(), Categories(), Favourite()];
  PageController controller = PageController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => PageState())],
      builder: (context, child) {
        final pageState = Provider.of<PageState>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WillPopScope(
            onWillPop: () async {
              if (pageState.currentPage != 0) {
                pageState.changePage(0);
                controller.jumpTo(0);
                return false;
              } else {
                return true;
              }
            },
            child: Scaffold(
              body: PageView(
                physics: BouncingScrollPhysics(),
                controller: controller,
                children: pages,
                onPageChanged: (index) {
                  pageState.changePage(index);
                },
              ),
              bottomNavigationBar:
                  BottomNavigationWidget(pageController: controller),
            ),
          ),
        );
      },
    );
  }
}
