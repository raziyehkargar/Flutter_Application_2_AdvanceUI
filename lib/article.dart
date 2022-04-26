import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_advance_ui/gen/assets.gen.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      appBar: AppBar(
        title: const Text('Article'),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded)),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
            child: Text(
              'Four Things Every Woman Needs To Know',
              style: themeData.textTheme.headline4,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Assets.img.stories.story10
                      .image(width: 48, height: 48, fit: BoxFit.cover),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Richard Gervain',
                        style: themeData.textTheme.bodyText1!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text('2m ago'),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.share,
                        color: themeData.colorScheme.primary)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.bookmark,
                        color: themeData.colorScheme.primary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
