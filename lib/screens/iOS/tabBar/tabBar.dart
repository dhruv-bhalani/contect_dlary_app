import 'package:contect_dlary_app/screens/iOS/contact/contact.dart';

import 'package:contect_dlary_app/screens/iOS/favorites/favvorites.dart';
import 'package:contect_dlary_app/screens/iOS/home/homepage.dart';
import 'package:flutter/cupertino.dart';

class iOSTabbar extends StatefulWidget {
  const iOSTabbar({super.key});

  @override
  State<iOSTabbar> createState() => _iOSTabbarState();
}

class _iOSTabbarState extends State<iOSTabbar> {
  List pages = [
    const iOSHomepage(),
    const iOSFavvorites(),
    const iOSContact(),
  ];
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.time),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Contact',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return pages[index];
      },
    );
  }
}
