import 'package:flutter/material.dart';
import 'package:papered/widgets/colors_widget.dart';
import 'package:papered/widgets/theme_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  "Appearance",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const ThemeDialog();
                      });
                },
                title: const Text(
                  "Select theme mode",
                ),
                leading: const Icon(Icons.format_paint),
                subtitle: const Text("Choose theme mode"),
              ),
              const ListTile(
                title: Text("Select dark theme"),
                subtitle: Text(
                    "Choose the dark theme to use when dark mode is enabled"),
                leading: Icon(Icons.color_lens),
              ),
              ListTile(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return const ColorsWidget();
                      }),
                  title: const Text("Pick accent color"),
                  subtitle: const Text("Select accent color"),
                  leading: const Icon(Icons.colorize)),
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
                            child: const Icon(
                              Icons.code,
                              color: Colors.black,
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
                            child: const Icon(
                              Icons.message,
                              color: Colors.blueAccent,
                              size: 30,
                            )),
                        InkWell(
                            onTap: () async {
                              const url = "https://twitter.com/yashrajjain726";
                              if (await canLaunch(url)) {
                                await launch(url);
                              }
                            },
                            child: const Icon(
                              Icons.rocket,
                              color: Colors.blue,
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
