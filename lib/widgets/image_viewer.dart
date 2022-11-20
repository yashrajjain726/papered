import 'package:flutter/material.dart';
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
      backgroundColor: Colors.white,
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
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        overlayColor: Colors.transparent,
        overlayOpacity: 0.8,
        iconTheme: const IconThemeData(color: Colors.black),
        children: [
          SpeedDialChild(
            child: const Icon(
              Icons.download,
            ),
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.wallpaper,
            ),
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.favorite_outline,
            ),
          ),
        ],
      ),
    );
  }
}
