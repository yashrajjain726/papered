import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:papered/providers/themestate.dart';
import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    var themeState = Provider.of<ThemeState>(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Info",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            elevation: 0,
            child: ListTile(
              leading: const CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/yashrajjain726"),
              ),
              title: const Text("Yashraj Jain"),
              subtitle: const Text("App Developer"),
              trailing: SizedBox(
                width: 120.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () async {
                          const url = "https://github.com/yashrajjain726";
                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                        child: NeumorphicIcon(
                          Icons.code,
                          size: 30,
                        )),
                    InkWell(
                        onTap: () async {
                          const url =
                              "https://telegram.dog/yashrajjain726yashrajjain726";
                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                        child: NeumorphicIcon(
                          Icons.message,
                          size: 30,
                        )),
                    InkWell(
                        onTap: () async {
                          const url = "https://twitter.com/yashrajjain726";
                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                        child: NeumorphicIcon(
                          Icons.rocket,
                          size: 30,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}