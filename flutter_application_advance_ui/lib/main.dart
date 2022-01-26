import 'dart:ui';

import 'package:flutter/material.dart';

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
        ),
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
                height: 110,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 50,
                        height: 110,
                        color: Colors.red.shade400,
                        margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
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
