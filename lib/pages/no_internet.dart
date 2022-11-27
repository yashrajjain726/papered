import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:papered/pages/home.dart';
import 'package:papered/utils/utils.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({super.key});

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NeumorphicText(
            "No Internet Available !!",
            textStyle: NeumorphicTextStyle(
              fontFamily: 'Orbitron',
              fontSize: 20,
            ),
            textAlign: TextAlign.start,
            style:
                NeumorphicStyle(color: getcurrentThemeOppositeColor(context)),
          ),
          const SizedBox(
            height: 20,
          ),
          NeumorphicButton(
              onPressed: () => initTimer(context),
              child: NeumorphicText(
                "Try Again",
                textStyle: NeumorphicTextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
                style: NeumorphicStyle(
                    color: getcurrentThemeOppositeColor(context)),
              ))
        ],
      ),
    ));
  }
}
