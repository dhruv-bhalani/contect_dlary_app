import 'package:contect_dlary_app/utils/extension.dart';
import 'package:flutter/cupertino.dart';

class IosHomepage extends StatefulWidget {
  const IosHomepage({super.key});

  @override
  State<IosHomepage> createState() => _IosHomepageState();
}

class _IosHomepageState extends State<IosHomepage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoButton(
          child: const Icon(CupertinoIcons.add),
          onPressed: () {},
          padding: EdgeInsets.zero,
        ),
        middle: const Text('iOS Homepage'),
        leading: CupertinoButton(
          child: const Icon(CupertinoIcons.home),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          padding: EdgeInsets.zero,
        ),
        automaticallyImplyLeading: true,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'iOS Homepage',
              style: TextStyle(fontSize: 20),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.add,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.home,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.settings,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.heart,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.person,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.book,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.bookmark,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.search,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.cloud,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.cloud_download,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.cloud_upload,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.share,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.bookmark_fill,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.heart_fill,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.heart_solid,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.heart_slash,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.heart_slash_fill,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.heart_circle,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.heart_circle_fill,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.airplane,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.calendar,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.calendar_badge_plus,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.calendar_badge_minus,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.camera,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.camera_fill,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.camera_rotate,
                size: 30,
              ),
            ),
            10.height,
            CupertinoButton(
              onPressed: () {},
              child: const Icon(
                CupertinoIcons.camera_viewfinder,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
