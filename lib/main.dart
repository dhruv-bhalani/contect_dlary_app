import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:contect_dlary_app/routes/routes.dart';
import 'package:contect_dlary_app/screens/iOS/home/homepage.dart';
import 'package:contect_dlary_app/screens/android/homepage/home_provider/homeprovider.dart';
import 'package:contect_dlary_app/screens/android/countar/countar_provider/countar_provider.dart';

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
                      backgroundColor: Colors.blue.shade600,
                    ),
                    textTheme: const TextTheme(),
                    floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.blue.shade600,
                    ),
                    bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      selectedItemColor: Colors.blue.shade600,
                    ),
                    elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                      ),
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black.withAlpha(200)),
                    ),
                  ),
                  darkTheme: ThemeData.dark().copyWith(
                    // scaffoldBackgroundColor: Colors.blue,
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Colors.blue,
                    ),
                    textTheme: const TextTheme(
                      bodyMedium: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          // fontStyle: FontStyle.italic,
                          fontFamily: 'poppins'),
                    ),
                    floatingActionButtonTheme:
                        const FloatingActionButtonThemeData(
                      backgroundColor: Colors.blue,
                    ),
                    elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                    ),
                  ),
                  themeMode: context.watch<ContactProvider>().isdarkmode
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  routes: AppRoutes.allRoutes,
                )
              : CupertinoApp(
                  debugShowCheckedModeBanner: false,
                  theme: context.watch<ContactProvider>().isdarkmode
                      ? CupertinoThemeData(brightness: Brightness.dark)
                      : CupertinoThemeData(brightness: Brightness.light),
                  routes: AppRoutesiOS.allRoutes,
                );
        },
      ),
    );
  }
}
