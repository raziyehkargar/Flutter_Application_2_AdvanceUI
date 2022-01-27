import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_advance_ui/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFontFamilyEN = 'Avenir';

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xff0D253C);
    final secondryColor = Color(0xff2D4379);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,

        textTheme: TextTheme(
            subtitle1: TextStyle(
                fontFamily: defaultFontFamilyEN,
                fontSize: 15,
                color: secondryColor),
            headline6: TextStyle(
              fontFamily: defaultFontFamilyEN,
              fontWeight: FontWeight.w700,
              color: primaryColor,
            ),
            bodyText2: TextStyle(
              fontFamily: defaultFontFamilyEN,
              color: secondryColor,
              fontSize: 12,
            )),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final textTheme = themeData.textTheme;

    final stories = AppDatabase.stories;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Jonathan!',
                      style: textTheme.subtitle1,
                    ),
                    Image.asset(
                      'assets/img/icons/notification.png',
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 24),
                child: Text(
                  'Explore today’s',
                  style: textTheme.headline6,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: ListView.builder(
                    itemCount: stories.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                    itemBuilder: (context, index) {
                      final storyData = stories[index];
                      return Container(
                        margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 68,
                                  height: 68,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Color(0xff376AED),
                                            Color(0xff49B0E2),
                                            Color(0xff9CECFB),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomCenter),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(24))),
                                  child: Container(
                                    margin: const EdgeInsets.all(3),
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                          'assets/img/stories/${storyData.imageFileName}'),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Image.asset(
                                    'assets/img/icons/${storyData.iconFileName}',
                                    width: 24,
                                    height: 24,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              storyData.name,
                              style: textTheme.bodyText2,
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
