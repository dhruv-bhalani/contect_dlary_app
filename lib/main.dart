import 'dart:io';

import 'package:contect_dlary_app/routes/routes.dart';
import 'package:contect_dlary_app/screens/android/countar/countar_provider/countar_provider.dart';
import 'package:contect_dlary_app/screens/android/homepage/home_provider/homeprovider.dart';
import 'package:contect_dlary_app/screens/iOS/iOS_homepage.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: countar(),
        ),
        ChangeNotifierProvider.value(
          value: ContactProvider(),
        ),
      ],
      child: Consumer<ContactProvider>(
        builder: (context, value, child) {
          return context.watch<ContactProvider>().isAndiroid
              ? MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    appBarTheme: AppBarTheme(
                      backgroundColor: Colors.green.shade600,
                    ),
                    textTheme: const TextTheme(),
                    floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.green.shade600,
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      selectedItemColor: Colors.green.shade600,
                    ),
                    elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                      ),
                    ),
                  ),
                  // darkTheme: ThemeData.dark().copyWith(
                  //   // scaffoldBackgroundColor: Colors.blue,
                  //   appBarTheme: const AppBarTheme(
                  //     backgroundColor: Colors.red,
                  //   ),
                  //   textTheme: const TextTheme(
                  //     bodyMedium: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 40,
                  //         fontWeight: FontWeight.bold,
                  //         // fontStyle: FontStyle.italic,
                  //         fontFamily: 'poppins'),
                  //   ),
                  //   floatingActionButtonTheme:
                  //       const FloatingActionButtonThemeData(
                  //     backgroundColor: Colors.red,
                  //   ),
                  //   elevatedButtonTheme: ElevatedButtonThemeData(
                  //     style:
                  //         ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  //   ),
                  // ),
                  themeMode: ThemeData.dark().brightness == Brightness.dark
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  routes: AppRoutes.allRoutes,
                )
              : const CupertinoApp(
                  debugShowCheckedModeBanner: false,
                  theme: CupertinoThemeData(
                    brightness: Brightness.light,
                  ),
                  home: IosHomepage(),
                );
        },
      ),
    );
  }
}
