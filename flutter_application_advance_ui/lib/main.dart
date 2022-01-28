import 'package:flutter/material.dart';
import 'package:flutter_application_advance_ui/data.dart';
import 'package:dotted_border/dotted_border.dart';

void main() {
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,

        textTheme: const TextTheme(
            subtitle1: TextStyle(
                fontFamily: defaultFontFamilyEN,
                fontSize: 18,
                fontWeight: FontWeight.w200,
                color: secondryTextColor),
            headline6: TextStyle(
              fontFamily: defaultFontFamilyEN,
              fontWeight: FontWeight.w700,
              color: primaryTextColor,
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
              //Name and icon
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
                      width: 32,
                      height: 32,
                    ),
                  ],
                ),
              ),
              //Explore today's
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 32, 24),
                child: Text(
                  'Explore today’s',
                  style: textTheme.headline4,
                ),
              ),
              // List of stories
              _StoriesList(stories: stories, textTheme: textTheme),
              //list categories
            ],
          ),
        ),
      ),
    );
  }
}

class _StoriesList extends StatelessWidget {
  const _StoriesList({
    Key? key,
    required this.stories,
    required this.textTheme,
  }) : super(key: key);

  final List<StoryData> stories;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 110,
      child: ListView.builder(
          itemCount: stories.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          itemBuilder: (context, index) {
            final storyData = stories[index];
            return _Story(storyData: storyData, textTheme: textTheme);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    Key? key,
    required this.storyData,
    required this.textTheme,
  }) : super(key: key);

  final StoryData storyData;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              (storyData.isViewed)
                  ? _profileImageViewed()
                  : _profileImageNormal(),
              Positioned(
                right: -2,
                bottom: -2,
                child: Image.asset(
                  'assets/img/icons/${storyData.iconFileName}',
                  width: 24,
                  height: 24,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            storyData.name,
          ),
        ],
      ),
    );
  }

  Widget _profileImageViewed() {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        radius: const Radius.circular(24),
        color: const Color(0xff7B8BB2),
        dashPattern: const [
          8,
          3,
        ],
        padding: const EdgeInsets.all(7),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _imageStory(),
        ),
      ),
    );
  }

  Widget _profileImageNormal() {
    return Container(
      width: 68,
      height: 68,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFB),
          ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.all(Radius.circular(24))),
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(7),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(22),
          ),
        ),
        child: _imageStory(),
      ),
    );
  }

  Widget _imageStory() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Image.asset('assets/img/stories/${storyData.imageFileName}'),
    );
  }
}
