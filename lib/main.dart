import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:papered/pages/categories.dart';
import 'package:papered/pages/favourite.dart';
import 'package:papered/pages/explore.dart';
import 'package:papered/pages/home.dart';
import 'package:papered/pages/search.dart';
import 'package:papered/pages/settings.dart';
import 'package:papered/providers/pagestate.dart';
import 'package:papered/widgets/bottom_navigation_widget.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => PageState())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => Home()},
    );
  }
}
