import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_advance_ui/home.dart';
import 'package:flutter_application_advance_ui/onboarding.dart';

import 'gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: ((context) => const OnBoardingScreen()))));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
            child: Assets.img.background.splash.image(fit: BoxFit.cover)),
        Center(
          child: Assets.img.background.logo.svg(width: 100),
        ),
      ]),
    );
  }
}
