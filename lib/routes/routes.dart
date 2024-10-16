import 'package:contect_dlary_app/screens/Detailpage/views/Detail.dart';
import 'package:contect_dlary_app/screens/addcontactPage/addcontactPage.dart';
import 'package:contect_dlary_app/screens/countar/views/countar.dart';
import 'package:contect_dlary_app/screens/homepage/home/homepage.dart';
import 'package:contect_dlary_app/screens/introduction/views/introduction.dart';
import 'package:contect_dlary_app/screens/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  // static String homepage = '/homepage';
  // static String intro = '/intro';
  static Map<String, WidgetBuilder> allRoutes = {
    '/': (context) => const Splashscreen(),
    '/intro': (context) => const Introduction(),
    '/home': (context) => const Homepage(),
    '/addcontact': (context) => const Addcontactpage(),
    '/countar': (context) => const Countar(),
    '/Detail': (context) => const Detail(),
  };
}
