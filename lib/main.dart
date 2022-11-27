import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:papered/pages/home.dart';
import 'package:papered/pages/splash.dart';
import 'package:papered/providers/categorystate.dart';
import 'package:papered/providers/explorestate.dart';
import 'package:papered/providers/favoritestate.dart';
import 'package:papered/providers/pagestate.dart';
import 'package:papered/providers/searchstate.dart';
import 'package:papered/providers/themestate.dart';
import 'package:provider/provider.dart';

const _kTestingCrashlytics = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: false);
  await Firebase.initializeApp();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<void> _initializeCrashlytics;
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  Future<void> _initializeFlutterCrashlytics() async {
    if (_kTestingCrashlytics) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } else {
      await FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(!kDebugMode);
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeCrashlytics = _initializeFlutterCrashlytics();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageState()),
        ChangeNotifierProvider(create: (context) => ThemeState()),
        ChangeNotifierProvider(create: (context) => FavoriteState()),
        ChangeNotifierProvider(create: (context) => ExploreState()),
        ChangeNotifierProvider(create: (context) => CategoryState()),
        ChangeNotifierProvider(create: (context) => SearchState())
      ],
      builder: (context, _) {
        final themeState = Provider.of<ThemeState>(context);
        themeState.getTheme();
        return NeumorphicApp(
          navigatorObservers: [observer],
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
          routes: {
            '/': (context) => const Splash(),
          },
        );
      },
    );
  }
}
