import 'package:flutter/material.dart';
import 'package:papered/pages/categories.dart';
import 'package:papered/pages/explore.dart';
import 'package:papered/pages/favourite.dart';
import 'package:papered/pages/settings.dart';
import 'package:papered/providers/pagestate.dart';
import 'package:papered/widgets/bottom_navigation_widget.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = const [Explore(), Categories(), Favourite(), Settings()];

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: IndexedStack(index: pageState.currentPage, children: pages),
      bottomNavigationBar: BottomNavigationWidget(controller: controller),
    );
  }
}
