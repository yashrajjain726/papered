import 'package:flutter/material.dart';
import 'package:papered/widgets/image_viewer.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageGrid extends StatelessWidget {
  final data;
  const ImageGrid({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ImageViewer(data: data)));
      },
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
              image: data['img'],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
