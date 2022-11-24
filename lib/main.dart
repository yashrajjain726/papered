import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:papered/pages/home.dart';
import 'package:papered/providers/favoritestate.dart';
import 'package:papered/providers/pagestate.dart';
import 'package:papered/providers/themestate.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: false);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageState()),
        ChangeNotifierProvider(create: (context) => ThemeState()),
        ChangeNotifierProvider(create: (context) => FavoriteState())
      ],
      builder: (context, _) {
        final themeState = Provider.of<ThemeState>(context);
        themeState.getTheme();
        return NeumorphicApp(
          materialTheme: ThemeData(fontFamily: 'Orbitron'),
          debugShowCheckedModeBanner: false,
          themeMode: themeState.currentThemeMode,
          theme: const NeumorphicThemeData(
            baseColor: Color(0xffE0E0E0),
            depth: 8,
            defaultTextColor: Colors.black,
            shadowDarkColor: Colors.black,
            shadowLightColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            appBarTheme: NeumorphicAppBarThemeData(
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
            ),
            accentColor: Color(0xffE0E0E0),
          ),
          darkTheme: themeState.getDarkTheme(),
          initialRoute: '/',
          routes: {'/': (context) => const Home()},
        );
      },
    );
  }
}
