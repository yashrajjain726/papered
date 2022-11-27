import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:papered/pages/home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 30), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (builder) => const Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Image.asset(
              "assets/images/logo.png",
              width: MediaQuery.of(context).size.width,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NeumorphicText(
                'Papered',
                textStyle:
                    NeumorphicTextStyle(fontFamily: 'Orbitron', fontSize: 30),
                textAlign: TextAlign.start,
                style: const NeumorphicStyle(color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              NeumorphicText(
                'Neumorphic based wallpaper App',
                textStyle:
                    NeumorphicTextStyle(fontFamily: 'Orbitron', fontSize: 20),
                textAlign: TextAlign.start,
                style: const NeumorphicStyle(color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
