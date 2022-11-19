import 'package:flutter/material.dart';

class CategoriesGrid extends StatelessWidget {
  final category;
  const CategoriesGrid({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(60)),
              image: DecorationImage(
                  image: NetworkImage(category['bg_img']),
                  fit: BoxFit.contain)),
          child: SizedBox(
            child: Stack(children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.all(Radius.circular(60)),
                ),
              ),
              Center(
                child: Text(
                  category['category_type'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ),
            ]),
          )),
    );
  }
}
