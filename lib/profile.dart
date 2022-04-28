import 'package:flutter/material.dart';
import 'package:flutter_application_advance_ui/data.dart';
import 'package:flutter_application_advance_ui/gen/assets.gen.dart';
import 'package:flutter_application_advance_ui/home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AppBar(
              backgroundColor: themeData.colorScheme.background.withOpacity(0),
              elevation: 0,
              title: const Text('profile'),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_outlined)),
                const SizedBox(
                  width: 16,
                )
              ],
            ),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(32),
                  margin: const EdgeInsets.fromLTRB(32, 8, 32, 64),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: themeData.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                          color: themeData.colorScheme.onBackground
                              .withOpacity(0.1),
                          blurRadius: 20),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Assets.img.stories.story5
                                  .image(width: 84, height: 84)),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('@jovidian'),
                                Text(
                                  'Jovi Daniel',
                                  style: themeData.textTheme.bodyText1!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text('UX Designer',
                                    style: themeData.textTheme.bodyText1!.apply(
                                        color: themeData.colorScheme.primary)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        'About me',
                        style: themeData.textTheme.headline6,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                        style: themeData.textTheme.bodyText1!
                            .copyWith(fontWeight: FontWeight.w200),
                      ),
                      const SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 32,
                  right: 96,
                  left: 96,
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: themeData.colorScheme.onBackground
                                .withOpacity(0.8),
                            blurRadius: 40)
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 32,
                    left: 64,
                    right: 64,
                    child: Container(
                      height: 68,
                      decoration: BoxDecoration(
                          color: themeData.colorScheme.primary,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: themeData.colorScheme.primaryContainer,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '74',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              themeData.colorScheme.onPrimary),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Post',
                                      style: themeData.textTheme.bodyText1!
                                          .copyWith(
                                              color: themeData
                                                  .colorScheme.onPrimary,
                                              fontWeight: FontWeight.w200),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '340',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Following',
                                    style: themeData.textTheme.bodyText1!
                                        .copyWith(
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            fontWeight: FontWeight.w200),
                                  ),
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '14.2K',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeData.colorScheme.onPrimary),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Followers',
                                    style: themeData.textTheme.bodyText1!
                                        .copyWith(
                                            color:
                                                themeData.colorScheme.onPrimary,
                                            fontWeight: FontWeight.w200),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    )),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color:
                            themeData.colorScheme.onBackground.withOpacity(0.1),
                        blurRadius: 20),
                  ],
                  color: themeData.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 16, 32, 4),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'My Posst',
                            style: themeData.textTheme.headline6,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.img.icons.grid.svg(),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Assets.img.icons.table.svg(),
                        ),
                      ],
                    ),
                  ),
                  for (var i = 0; i < posts.length; i++)
                    PostItem(
                      post: posts[i],
                      themeData: themeData,
                    ),

                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height / 2,
                  //   child: ListView.builder(
                  //     physics: const ClampingScrollPhysics(),
                  //     itemCount: posts.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return PostItem(
                  //         post: posts[index],
                  //         themeData: themeData,
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
