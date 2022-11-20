import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:papered/pages/home.dart';
import 'package:papered/providers/pagestate.dart';
import 'package:papered/providers/themestate.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        ChangeNotifierProvider(create: (context) => ThemeState())
      ],
      builder: (context, _) {
        final themeState = Provider.of<ThemeState>(context);
        final pageState = Provider.of<PageState>(context);
        themeState.getTheme();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeState.currentThemeMode,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            canvasColor: Colors.white,
            primaryColor: Colors.white,
            colorScheme: const ColorScheme.light()
                .copyWith(secondary: themeState.currentAccent),
          ),
          darkTheme: themeState.getDarkTheme(),
          initialRoute: '/',
          routes: {'/': (context) => const Home()},
        );
      },
    );
  }
}
