import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_advance_ui/auth.dart';
import 'package:flutter_application_advance_ui/data.dart';
import 'package:flutter_application_advance_ui/gen/assets.gen.dart';
import 'package:flutter_application_advance_ui/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final items = AppDatabase.onBoardingItems;
  final PageController _pageContoller = PageController();
  int page = 0;
  @override
  void initState() {
    _pageContoller.addListener(() {
      if (_pageContoller.page!.round() != page) {
        setState(() {
          page = _pageContoller.page!.round();
          debugPrint("Selected Page => $page");
        });
      }
    });
    super.initState();
  }

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
              height: 270,
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
                  Expanded(
                    child: PageView.builder(
                        itemCount: items.length,
                        controller: _pageContoller,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[index].title,
                                  style: themeDate.textTheme.headline5,
                                ),
                                const SizedBox(height: 20),
                                Text(items[index].description,
                                    style: themeDate.textTheme.subtitle1!.apply(
                                      fontSizeFactor: 0.8,
                                    )),
                              ],
                            ),
                          );
                        }),
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                          controller: _pageContoller,
                          count: items.length,
                          effect: ExpandingDotsEffect(
                            dotColor:
                                themeDate.colorScheme.primary.withOpacity(.1),
                            activeDotColor: themeDate.colorScheme.primary,
                            dotHeight: 8,
                            dotWidth: 8,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (page == items.length - 1) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AuthScreen()));
                            } else {
                              _pageContoller.animateToPage(
                                ++page,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.decelerate,
                              );
                            }
                          },
                          child: (page == items.length - 1)
                              ? const Icon(CupertinoIcons.check_mark)
                              : const Icon(CupertinoIcons.arrow_right),
                          style: ButtonStyle(
                            minimumSize:
                                MaterialStateProperty.all(const Size(88, 60)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
