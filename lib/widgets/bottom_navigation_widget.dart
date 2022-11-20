import 'package:flutter/material.dart';
import 'package:papered/providers/pagestate.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigationWidget extends StatefulWidget {
  final PageController controller;
  const BottomNavigationWidget({super.key, required this.controller});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context);
    return SalomonBottomBar(
      margin: const EdgeInsets.all(20),
      currentIndex: pageState.currentPage,
      onTap: (index) {
        pageState.changePage(index);
        widget.controller.jumpToPage(index);
      },
      selectedItemColor: Colors.red,
      selectedColorOpacity: 0,
      unselectedItemColor: Colors.grey[600],
      items: [
        SalomonBottomBarItem(
          icon: const Icon(Icons.home),
          title: const Text(""),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.category),
          title: const Text(""),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.favorite_outline),
          title: const Text(""),
        ),
        SalomonBottomBarItem(
          icon: const Icon(Icons.settings),
          title: const Text(""),
        )
      ],
    );
  }
}
