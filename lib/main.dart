import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_advance_ui/article.dart';
import 'package:flutter_application_advance_ui/onboarding.dart';
import 'package:flutter_application_advance_ui/splash.dart';

import 'home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const defaultFontFamilyEN = 'Avenir';

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          surface: Colors.white,
          onSurface: primaryTextColor,
          background: Color(0xfffBFBFF),
          onBackground: primaryTextColor,
        ),
        primaryColor: primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: primaryTextColor,
          elevation: 0,
          titleSpacing: 32,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontFamily: defaultFontFamilyEN,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: primaryColor,
              ),
            ),
          ),
        ),
        textTheme: const TextTheme(
            subtitle1: TextStyle(
                fontFamily: defaultFontFamilyEN,
                fontSize: 18,
                fontWeight: FontWeight.w200,
                color: secondryTextColor),
            subtitle2: TextStyle(
                fontFamily: defaultFontFamilyEN,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: secondryTextColor),
            headline6: TextStyle(
              fontFamily: defaultFontFamilyEN,
              fontWeight: FontWeight.w700,
              color: primaryTextColor,
            ),
            headline5: TextStyle(
              fontFamily: defaultFontFamilyEN,
              fontWeight: FontWeight.w700,
              color: primaryTextColor,
              fontSize: 20,
            ),
            headline4: TextStyle(
              fontFamily: defaultFontFamilyEN,
              fontWeight: FontWeight.w700,
              color: primaryTextColor,
              fontSize: 24,
            ),
            bodyText2: TextStyle(
              fontFamily: defaultFontFamilyEN,
              color: secondryTextColor,
              fontSize: 12,
            ),
            caption: TextStyle(
              fontFamily: defaultFontFamilyEN,
              fontWeight: FontWeight.w700,
              fontSize: 10,
              color: Color(0xff788882),
            )),
      ),
      // home: Stack(
      //   children: [
      //     const Positioned.fill(child: HomeScreen()),
      //     Positioned(bottom: 0, right: 0, left: 0, child: _BottomNavigation()),
      //   ],
      // ),

      home: const ArticleScreen(),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: const Color(0x2D2D2D).withOpacity(0.14),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _BottomNavigationItem(
                      iconFileName: 'Home.png',
                      activeIconFileName: 'Home.png',
                      title: 'Home'),
                  _BottomNavigationItem(
                      iconFileName: 'Articles.png',
                      activeIconFileName: 'Articles.png',
                      title: 'Articles'),
                  SizedBox(
                    width: 8,
                  ),
                  _BottomNavigationItem(
                      iconFileName: 'Menu.png',
                      activeIconFileName: 'Menu.png',
                      title: 'Menu'),
                  _BottomNavigationItem(
                      iconFileName: 'Search.png',
                      activeIconFileName: 'Search.png',
                      title: 'Search'),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.topCenter,
              child: Container(
                width: 65,
                height: 65,
                child: Image.asset('assets/img/icons/plus.png'),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.5),
                  color: Theme.of(context).primaryColor,
                  border: Border.all(color: Colors.white, width: 4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String activeIconFileName;
  final String title;

  const _BottomNavigationItem(
      {Key? key,
      required this.iconFileName,
      required this.activeIconFileName,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/img/icons/$iconFileName'),
        const SizedBox(height: 4),
        Text(
          title,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
