import 'package:contect_dlary_app/screens/android/Detailpage/views/Detail.dart';

import 'package:contect_dlary_app/screens/android/addcontactPage/addcontactPage.dart';
import 'package:contect_dlary_app/screens/android/countar/views/countar.dart';

import 'package:contect_dlary_app/screens/android/homepage/home/homepage.dart';
import 'package:contect_dlary_app/screens/android/introduction/views/introduction.dart';
import 'package:contect_dlary_app/screens/android/profile/profile.dart';
import 'package:contect_dlary_app/screens/android/splashscreen/splashscreen.dart';
import 'package:contect_dlary_app/screens/iOS/Profile/iOSProfile.dart';

import 'package:contect_dlary_app/screens/iOS/contact/contact.dart';
import 'package:contect_dlary_app/screens/iOS/detail/detail.dart';

import 'package:contect_dlary_app/screens/iOS/home/homepage.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> allRoutes = {
    '/': (context) => const Splashscreen(),
    '/intro': (context) => const Introduction(),
    '/home': (context) => const Homepage(),
    '/addcontact': (context) => const Addcontactpage(),
    '/countar': (context) => const Countar(),
    '/Detail': (context) => const Detail(),
    '/profile': (context) => const Profile(),
    // '/': (context) => const Sliver(),
  };
}

class AppRoutesiOS {
  static Map<String, WidgetBuilder> allRoutes = {
    '/': (context) => const iOSHomepage(),
    '/iOSDetail': (context) => const iOSDetailPage(),
    '/countars': (context) => const iOSContact(),
    '/profile': (context) => const iOSProfile(),
    // '/': (context) => const iOSSliver(),
  };
}
