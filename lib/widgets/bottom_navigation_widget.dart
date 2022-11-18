import 'package:flutter/material.dart';
import 'package:papered/providers/pagestate.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigationWidget extends StatelessWidget {
  final PageController pageController;
  const BottomNavigationWidget({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context);
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(60),
      ),
      padding: EdgeInsets.all(8),
      child: SalomonBottomBar(
        currentIndex: pageState.currentPage,
        onTap: (index) {
          pageState.changePage(index);
          pageController.jumpToPage(index);
        },
        selectedItemColor: Colors.red,
        selectedColorOpacity: 0,
        unselectedItemColor: Colors.grey[600],
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text(""),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text(""),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.category),
            title: Text(""),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_outline),
            title: Text(""),
          ),
        ],
      ),
    );
  }
}
