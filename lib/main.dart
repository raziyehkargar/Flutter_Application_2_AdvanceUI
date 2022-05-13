import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_advance_ui/article.dart';
import 'package:flutter_application_advance_ui/profile.dart';

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
          primaryContainer: Color(0xff2151CD),
        ),
        primaryColor: primaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: primaryTextColor,
          titleSpacing: 32,
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: primaryColor,
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
            bodyText1: TextStyle(
              fontFamily: defaultFontFamilyEN,
              color: primaryTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
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

      home: const MainScreen(),
    );
  }
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int profileIndex = 3;
const double bottomNavigationHeight = 65;

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedTabIndex = homeIndex;
  final List<int> _history = [];
  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _articleKey = GlobalKey();
  final GlobalKey<NavigatorState> _searchKey = GlobalKey();
  final GlobalKey<NavigatorState> _menuKey = GlobalKey();

  late final mapScreen = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    profileIndex: _menuKey
  };

  Future<bool> _onWillPop() async {
    NavigatorState currentSelectedTabNavigatoreState =
        mapScreen[selectedTabIndex]!.currentState!;
    if (currentSelectedTabNavigatoreState.canPop()) {
      currentSelectedTabNavigatoreState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedTabIndex = _history.last;
        _history.removeLast();
      });

      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              bottom: bottomNavigationHeight,
              child: IndexedStack(
                index: selectedTabIndex,
                children: [
                  Navigator(
                    key: _homeKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  ),
                  Navigator(
                    key: _articleKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const ArticleScreen(),
                    ),
                  ),
                  Navigator(
                    key: _searchKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ),
                  ),
                  Navigator(
                    key: _menuKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: _BottomNavigation(
                onSelectedTab: (int index) {
                  setState(() {
                    _history.remove(selectedTabIndex);
                    _history.add(selectedTabIndex);
                    selectedTabIndex = index;
                  });
                },
                selectedIndex: selectedTabIndex,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Search Screen',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  final Function(int index) onSelectedTab;
  final int selectedIndex;
  const _BottomNavigation(
      {Key? key, required this.onSelectedTab, required this.selectedIndex})
      : super(key: key);
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
              height: bottomNavigationHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: const Color(0xff2D2D2D).withOpacity(0.14),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _BottomNavigationItem(
                    iconFileName: 'Home.png',
                    activeIconFileName: 'HomeActive.png',
                    title: 'Home',
                    isActive: selectedIndex == homeIndex,
                    onTap: () {
                      onSelectedTab(homeIndex);
                    },
                  ),
                  _BottomNavigationItem(
                    iconFileName: 'Articles.png',
                    activeIconFileName: 'ArticlesActive.png',
                    title: 'Articles',
                    isActive: selectedIndex == articleIndex,
                    onTap: () {
                      onSelectedTab(articleIndex);
                    },
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  _BottomNavigationItem(
                    iconFileName: 'Search.png',
                    activeIconFileName: 'SearchActive.png',
                    title: 'Search',
                    isActive: selectedIndex == searchIndex,
                    onTap: () {
                      onSelectedTab(searchIndex);
                    },
                  ),
                  _BottomNavigationItem(
                    iconFileName: 'Menu.png',
                    activeIconFileName: 'MenuActive.png',
                    title: 'Menu',
                    isActive: selectedIndex == profileIndex,
                    onTap: () {
                      onSelectedTab(profileIndex);
                    },
                  ),
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
                child: Image.asset('assets/img/icons/Plus.png'),
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
  final bool isActive;
  final Function() onTap;

  const _BottomNavigationItem({
    Key? key,
    required this.iconFileName,
    required this.activeIconFileName,
    required this.title,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/icons/${isActive ? activeIconFileName : iconFileName}',
              width: 32,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: themeData.textTheme.caption!.apply(
                  color: isActive
                      ? themeData.colorScheme.primary
                      : themeData.textTheme.caption!.color),
            ),
          ],
        ),
      ),
    );
  }
}
