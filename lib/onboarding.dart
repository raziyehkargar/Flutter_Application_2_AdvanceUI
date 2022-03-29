import 'package:flutter/material.dart';
import 'package:flutter_application_advance_ui/gen/assets.gen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Assets.img.background.onboarding.image(),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
