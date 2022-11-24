import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageViewer extends StatefulWidget {
  final data;
  const ImageViewer({super.key, required this.data});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  double angle = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
          tag: widget.data['tag'],
          transitionOnUserGestures: true,
          child: Stack(children: [
            Container(
                constraints: const BoxConstraints.expand(),
                child: InteractiveViewer(
                  onInteractionUpdate: (ScaleUpdateDetails details) {},
                  onInteractionEnd: (ScaleEndDetails details) {},
                  child: Transform.rotate(
                    angle: angle,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: widget.data['img'],
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
          ])),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NeumorphicButton(
            padding: const EdgeInsets.all(15),
            style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
            child: NeumorphicIcon(
              Icons.download,
              style: NeumorphicStyle(color: Theme.of(context).iconTheme.color),
            ),
          ),
          NeumorphicButton(
            padding: const EdgeInsets.all(15),
            style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
            child: NeumorphicIcon(
              Icons.wallpaper,
              style: NeumorphicStyle(color: Theme.of(context).iconTheme.color),
            ),
          ),
          NeumorphicButton(
            padding: const EdgeInsets.all(15),
            style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
            child: NeumorphicIcon(
              Icons.favorite_outline,
              style: NeumorphicStyle(color: Theme.of(context).iconTheme.color),
            ),
          ),
        ],
      ),
    );
  }
}
