import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_advance_ui/article.dart';

import 'carousel/carousel_slider.dart';
import 'data.dart';
import 'gen/assets.gen.dart';

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
          physics: const BouncingScrollPhysics(),
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
                    Assets.img.icons.notification.image(
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
              _CategoriesList(),
              //list of postes
              _PostList(),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoriesList extends StatelessWidget {
  final List<Category> categories = AppDatabase.categories;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (context, index, realIndex) {
          final category = categories[realIndex];
          return _CategoryItem(
              category: category,
              left: realIndex == 0 ? 32 : 8,
              right: realIndex == categories.length - 1 ? 32 : 8);
        },
        options: CarouselOptions(
          viewportFraction: 0.8,
          aspectRatio: 1.2,
          initialPage: 0,
          disableCenter: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          autoPlay: false,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
        ));
  }
}

class _CategoryItem extends StatelessWidget {
  final double left;
  final double right;
  const _CategoryItem({
    Key? key,
    required this.category,
    required this.left,
    required this.right,
  }) : super(key: key);

  static const double radius = 32;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          //Shadow under container
          Positioned.fill(
            left: 65,
            right: 65,
            bottom: 20,
            top: 100,
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color(0xaa0D253C),
                  blurRadius: 20,
                )
              ]),
            ),
          ),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 8, 16),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(radius),
              ),
              foregroundDecoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff0D253C), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                  borderRadius: BorderRadius.circular(radius)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image.asset(
                  'assets/img/posts/large/${category.imageFileName}',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 48,
              left: 32,
              child: Text(
                category.title,
                style: Theme.of(context).textTheme.headline6!.apply(
                      color: Colors.white,
                    ),
              ))
        ],
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

class _PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postsList = AppDatabase.posts;
    final ThemeData themeData = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('latest News', style: themeData.textTheme.headline5),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'More',
                    style: TextStyle(
                      color: themeData.primaryColor,
                    ),
                  )),
            ],
          ),
        ),
        ListView.builder(
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemExtent: 149,
          shrinkWrap: true,
          itemCount: postsList.length,
          itemBuilder: (context, index) {
            final post = postsList[index];
            return PostItem(post: post, themeData: themeData);
          },
        ),
      ],
    );
  }
}

class PostItem extends StatelessWidget {
  const PostItem({
    Key? key,
    required this.post,
    required this.themeData,
  }) : super(key: key);

  static const double radius = 16;
  final PostData post;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ArticleScreen(),
      )),
      child: Container(
        margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
        height: 149,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1a5282FF),
              blurRadius: 10,
            )
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image.asset(
                  'assets/img/posts/small/${post.imageFileName}',
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.caption,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: themeData.primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      post.title,
                      style: themeData.textTheme.subtitle2,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.hand_thumbsup,
                          size: 20,
                          color: themeData.textTheme.bodyText2!.color,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          post.likes,
                          style: themeData.textTheme.bodyText2,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Icon(
                          CupertinoIcons.time,
                          size: 20,
                          color: themeData.textTheme.bodyText2!.color,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          post.time,
                          style: themeData.textTheme.bodyText2,
                        ),
                        post.isBookmarked
                            ? Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    CupertinoIcons.bookmark,
                                    size: 20,
                                    color: themeData.primaryColor,
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
