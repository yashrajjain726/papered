import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:papered/providers/favoritestate.dart';
import 'package:papered/utils/preferences.dart';
import 'package:papered/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageViewer extends StatefulWidget {
  final String image;
  const ImageViewer({super.key, required this.image});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  void initState() {
    super.initState();
    checkAndRequestPermission();
  }

  Preference preference = Preference();

  downloadCurrentImage() async {
    var status = await Permission.storage.status.isGranted;
    if (status) {
      var response = await Dio().get(widget.image,
          options: Options(responseType: ResponseType.bytes));
      final result =
          await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
      if (result['isSuccess']) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: NeumorphicText(
          'Image Saved in local storage',
          // ignore: use_build_context_synchronously
          style: NeumorphicStyle(color: getcurrentThemeColor(context)),
          textStyle: NeumorphicTextStyle(
            fontFamily: 'Orbitron',
          ),
        )));
      }
    }
    if (await Permission.storage.isDenied) {
      checkAndRequestPermission();
    }
  }

  checkAndRequestPermission() async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.storage].request();
    final info = statuses[Permission.storage];
    if (info == PermissionStatus.permanentlyDenied) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: const EdgeInsets.all(15),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              content: NeumorphicText("Open app setting to grant access.",
                  textAlign: TextAlign.start,
                  style: NeumorphicStyle(
                      color: getcurrentThemeOppositeColor(context))),
              actions: <Widget>[
                TextButton(
                  child: NeumorphicText('OK',
                      textAlign: TextAlign.start,
                      style: NeumorphicStyle(
                          color: getcurrentThemeOppositeColor(context))),
                  onPressed: () async {
                    Navigator.pop(context);
                    openAppSettings();
                  },
                ),
                TextButton(
                  child: NeumorphicText('Close',
                      textAlign: TextAlign.start,
                      style: NeumorphicStyle(
                          color: getcurrentThemeOppositeColor(context))),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setWallpaperDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: getcurrentThemeColor(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: NeumorphicText(
                  'Set wallpaper',
                  textAlign: TextAlign.start,
                  style: NeumorphicStyle(
                      color: getcurrentThemeOppositeColor(context)),
                ),
              ),
              ListTile(
                title: NeumorphicText(
                  'Home Screen',
                  textStyle: NeumorphicTextStyle(
                    fontFamily: 'Orbitron',
                  ),
                  textAlign: TextAlign.start,
                  style: NeumorphicStyle(
                      color: getcurrentThemeOppositeColor(context)),
                ),
                leading: NeumorphicIcon(
                  Icons.home,
                  style: NeumorphicStyle(
                      color: getcurrentThemeOppositeColor(context)),
                ),
                onTap: () {
                  setWallpaper(1);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: getcurrentThemeOppositeColor(context),
                      content: NeumorphicText(
                        'Setting Wallpaper',
                        style: NeumorphicStyle(
                            color: getcurrentThemeColor(context)),
                        textStyle: NeumorphicTextStyle(
                          fontFamily: 'Orbitron',
                        ),
                      )));
                },
              ),
              ListTile(
                title: NeumorphicText(
                  'Lock Screen',
                  textAlign: TextAlign.start,
                  textStyle: NeumorphicTextStyle(
                    fontFamily: 'Orbitron',
                  ),
                  style: NeumorphicStyle(
                      color: getcurrentThemeOppositeColor(context)),
                ),
                leading: NeumorphicIcon(
                  Icons.lock,
                  style: NeumorphicStyle(
                      color: getcurrentThemeOppositeColor(context)),
                ),
                onTap: () {
                  setWallpaper(2);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: getcurrentThemeOppositeColor(context),
                      content: NeumorphicText(
                        'Setting Wallpaper',
                        style: NeumorphicStyle(
                            color: getcurrentThemeColor(context)),
                        textStyle: NeumorphicTextStyle(
                          fontFamily: 'Orbitron',
                        ),
                      )));
                },
              ),
              ListTile(
                title: NeumorphicText(
                  'Both',
                  textStyle: NeumorphicTextStyle(
                    fontFamily: 'Orbitron',
                  ),
                  textAlign: TextAlign.start,
                  style: NeumorphicStyle(
                      color: getcurrentThemeOppositeColor(context)),
                ),
                leading: NeumorphicIcon(
                  Icons.phone_android,
                  style: NeumorphicStyle(
                      color: getcurrentThemeOppositeColor(context)),
                ),
                onTap: () {
                  setWallpaper(3);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: getcurrentThemeOppositeColor(context),
                      content: NeumorphicText(
                        'Setting Wallpaper',
                        style: NeumorphicStyle(
                            color: getcurrentThemeColor(context)),
                        textStyle: NeumorphicTextStyle(
                          fontFamily: 'Orbitron',
                        ),
                      )));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> setWallpaper(int type) async {
    bool result;
    var file = await DefaultCacheManager().getSingleFile(widget.image);
    try {
      if (type == 1) {
        result = await WallpaperManager.setWallpaperFromFile(
            file.path, WallpaperManager.HOME_SCREEN);
      } else if (type == 2) {
        result = await WallpaperManager.setWallpaperFromFile(
            file.path, WallpaperManager.LOCK_SCREEN);
      } else if (type == 3) {
        result = await WallpaperManager.setWallpaperFromFile(
            file.path, WallpaperManager.BOTH_SCREEN);
      }
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        // ignore: use_build_context_synchronously
        backgroundColor: getcurrentThemeOppositeColor(context),
        content: NeumorphicText(
          'Wallpaper Set Successfully',
          // ignore: use_build_context_synchronously
          style: NeumorphicStyle(color: getcurrentThemeColor(context)),
          textStyle: NeumorphicTextStyle(
            fontFamily: 'Orbitron',
          ),
        )));
  }

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
                    angle: 0,
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
            onPressed: downloadCurrentImage,
            padding: const EdgeInsets.all(15),
            style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle()),
            child: NeumorphicIcon(
              Icons.download,
              style: NeumorphicStyle(color: Theme.of(context).iconTheme.color),
            ),
          ),
          NeumorphicButton(
            onPressed: setWallpaperDialog,
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
