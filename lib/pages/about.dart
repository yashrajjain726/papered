import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:papered/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({super.key});

  Future<void> _launchUrl(url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const CircleAvatar(
            radius: 100,
            backgroundImage: NetworkImage(
                "https://avatars.githubusercontent.com/yashrajjain726"),
          ),
          const SizedBox(
            height: 30,
          ),
          NeumorphicText(
            "Yashraj Jain",
            textStyle:
                NeumorphicTextStyle(fontFamily: 'Orbitron', fontSize: 20),
            textAlign: TextAlign.start,
            style:
                NeumorphicStyle(color: getcurrentThemeOppositeColor(context)),
          ),
          const SizedBox(
            height: 10,
          ),
          NeumorphicText(
            "Software Engineer | Freelancer",
            textStyle: NeumorphicTextStyle(fontFamily: 'Orbitron'),
            textAlign: TextAlign.start,
            style:
                NeumorphicStyle(color: getcurrentThemeOppositeColor(context)),
          ),
          const SizedBox(
            height: 100,
          ),
          NeumorphicText(
            "You can reach me at below profile's",
            textStyle:
                NeumorphicTextStyle(fontFamily: 'Orbitron', fontSize: 10),
            textAlign: TextAlign.start,
            style:
                NeumorphicStyle(color: getcurrentThemeOppositeColor(context)),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _launchUrl("https://yashrajjain.in/"),
                child: Neumorphic(
                  style: NeumorphicStyle(
                      color: getcurrentThemeOppositeColor(context)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NeumorphicText(
                      "Portfolio",
                      textStyle: NeumorphicTextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.start,
                      style:
                          NeumorphicStyle(color: getcurrentThemeColor(context)),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () =>
                    _launchUrl("https://www.linkedin.com/in/yashrajjain726/"),
                child: Neumorphic(
                  style: NeumorphicStyle(color: Colors.blue[900]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NeumorphicText(
                      "LinkedIn",
                      textStyle: NeumorphicTextStyle(
                          fontFamily: 'Orbitron', fontSize: 10),
                      textAlign: TextAlign.start,
                      style: const NeumorphicStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _launchUrl("https://github.com/yashrajjain726"),
                child: Neumorphic(
                  style: const NeumorphicStyle(color: Colors.redAccent),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NeumorphicText(
                      "Github",
                      textStyle: NeumorphicTextStyle(
                          fontFamily: 'Orbitron', fontSize: 10),
                      textAlign: TextAlign.start,
                      style: const NeumorphicStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () => _launchUrl("mailto:yashrajjain726@gmail.com"),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NeumorphicText(
                    "Email @ yashrajjain726@gmail.com",
                    textStyle: NeumorphicTextStyle(
                        fontFamily: 'Orbitron', fontSize: 10),
                    textAlign: TextAlign.start,
                    style: NeumorphicStyle(
                        color: getcurrentThemeOppositeColor(context)),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _launchUrl("tel:+91-7682985950"),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: NeumorphicText(
                    "Phone @ (+91) - 7682985950",
                    textStyle: NeumorphicTextStyle(
                        fontFamily: 'Orbitron', fontSize: 10),
                    textAlign: TextAlign.start,
                    style: NeumorphicStyle(
                        color: getcurrentThemeOppositeColor(context)),
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
