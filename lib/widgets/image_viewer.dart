import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:papered/providers/favoritestate.dart';
import 'package:papered/utils/preferences.dart';
import 'package:papered/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageViewer extends StatefulWidget {
  final String image;
  const ImageViewer({super.key, required this.image});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  double angle = 0.0;
  Preference preference = Preference();

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteState>(context, listen: true);
    return Scaffold(
      body: Hero(
          tag: '',
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
                      image: widget.image,
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
            onPressed: () {},
            padding: const EdgeInsets.all(15),
            style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
            child: NeumorphicIcon(
              Icons.download,
              style: NeumorphicStyle(color: Theme.of(context).iconTheme.color),
            ),
          ),
          NeumorphicButton(
            onPressed: () {},
            padding: const EdgeInsets.all(15),
            style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
            child: NeumorphicIcon(
              Icons.wallpaper,
              style: NeumorphicStyle(color: Theme.of(context).iconTheme.color),
            ),
          ),
          NeumorphicButton(
            padding: const EdgeInsets.all(15),
            onPressed: () {
              Provider.of<FavoriteState>(context, listen: false)
                  .updateFavoriteList(widget.image);
              preference.toggleFavorite(widget.image);
            },
            style: const NeumorphicStyle(
              boxShape: NeumorphicBoxShape.circle(),
            ),
            child: NeumorphicIcon(
              favoriteProvider.checkIsFavoriteImage(widget.image)
                  ? Icons.favorite
                  : Icons.favorite_border,
              style: NeumorphicStyle(
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
