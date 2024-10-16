import 'dart:async';

import 'package:contect_dlary_app/utils/shrHelper.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    ShrHelper shr = ShrHelper();
    shr.introStatus().then(
      (value) {
        if (value == true) {
          Timer(
            const Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(context, '/home'),
          );
        } else {
          Timer(
            const Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(context, '/intro'),
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/gif/1.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
