import 'package:contect_dlary_app/screens/android/Detailpage/views/Detail.dart';
import 'package:contect_dlary_app/screens/android/hide/hide.dart';
import 'package:contect_dlary_app/screens/android/addcontactPage/addcontactPage.dart';
import 'package:contect_dlary_app/screens/android/countar/views/countar.dart';
import 'package:contect_dlary_app/screens/android/favorites/favorites.dart';
import 'package:contect_dlary_app/screens/android/homepage/home/homepage.dart';
import 'package:contect_dlary_app/screens/android/introduction/views/introduction.dart';
import 'package:contect_dlary_app/screens/android/splashscreen/splashscreen.dart';
import 'package:contect_dlary_app/screens/iOS/iOS_homepage.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> allRoutes = {
    '/': (context) => const Splashscreen(),
    '/intro': (context) => const Introduction(),
    '/home': (context) => const Homepage(),
    '/addcontact': (context) => const Addcontactpage(),
    '/countar': (context) => const Countar(),
    '/Detail': (context) => const Detail(),
    '/hide': (context) => const Hide(),
    '/favorites': (context) => const Favorites(),
    '/iOS': (context) => const IosHomepage(),
  };
}
