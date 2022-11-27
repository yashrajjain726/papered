import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
            MaterialPageRoute(builder: (context) => ImageViewer(image: data)));
      },
      child: Neumorphic(
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(30))),
        child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: data,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
