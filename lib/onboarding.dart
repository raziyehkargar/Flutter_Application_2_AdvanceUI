import 'package:flutter/material.dart';
import 'package:flutter_application_advance_ui/gen/assets.gen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeDate = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 8),
                child: Center(child: Assets.img.background.onboarding.image()),
              ),
            ),
            Container(
              height: 324,
              decoration: BoxDecoration(
                  color: themeDate.colorScheme.surface,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20,
                        color:
                            themeDate.colorScheme.onBackground.withOpacity(.1))
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      //SmoothPageIndicator(controller: controller, count: count)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
