import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CategoriesGrid extends StatelessWidget {
  final category;
  const CategoriesGrid({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Neumorphic(
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                category['bg_img'],
                fit: BoxFit.cover,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              Center(
                child: NeumorphicText(
                  category['category_type'],
                  textAlign: TextAlign.center,
                  textStyle: NeumorphicTextStyle(
                      fontFamily: 'Orbitron',
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                  style: const NeumorphicStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
