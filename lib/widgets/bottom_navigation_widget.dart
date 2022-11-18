import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(60),
      ),
      padding: EdgeInsets.all(8),
      child: SalomonBottomBar(
        selectedItemColor: Colors.red,
        selectedColorOpacity: 0,
        unselectedItemColor: Colors.grey[600],
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text(""),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text(""),
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text(""),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text(""),
          ),
        ],
      ),
    );
  }
}
