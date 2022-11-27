import 'package:flutter/material.dart';
import 'package:papered/pages/home.dart';
import 'package:papered/pages/no_internet.dart';
import 'package:papered/pages/splash.dart';
import 'package:papered/utils/utils.dart';

class CheckConnection extends StatelessWidget {
  const CheckConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: checkInternet(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Splash();
            } else if (snapshot.data == true) {
              return const Home();
            } else {
              return const NoInternet();
            }
          }),
    );
  }
}
