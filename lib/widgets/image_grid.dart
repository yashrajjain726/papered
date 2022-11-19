import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageGrid extends StatelessWidget {
  final image;
  const ImageGrid({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Hero(
        tag: 'explore',
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: image['img'],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
