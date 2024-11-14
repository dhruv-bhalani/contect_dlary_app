import 'package:contect_dlary_app/screens/android/homepage/home_provider/homeprovider.dart';
import 'package:contect_dlary_app/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class iOSProfile extends StatefulWidget {
  const iOSProfile({super.key});

  @override
  State<iOSProfile> createState() => _iOSProfileState();
}

class _iOSProfileState extends State<iOSProfile> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Profile'),
      ),
      child: Container(
        height: 1000,
        width: 1000,
        // color: CupertinoColors.activeGreen,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, right: 16, left: 16),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 90,
                backgroundImage: AssetImage('lib/assets/image/1.jpg'),
              ),
              const SizedBox(height: 60),
              CupertinoTextField(
                decoration: BoxDecoration(
                  color: CupertinoColors.black.withAlpha(27),
                  borderRadius: BorderRadius.circular(10),
                ),
                placeholder: 'Dhruv',
                padding: const EdgeInsets.all(16),
              ),
              const SizedBox(height: 50),
              CupertinoListTile(
                title: const Text('Platform'),
                trailing: CupertinoSwitch(
                  value: context.watch<ContactProvider>().isAndiroid,
                  onChanged: (value) {
                    context.read<ContactProvider>().changeisAndiroid();
                  },
                ),
              ),
              10.height,
              CupertinoListTile(
                title: const Text('Theme'),
                trailing: CupertinoSwitch(
                  value: context.watch<ContactProvider>().isdarkmode,
                  onChanged: (value) {
                    context.read<ContactProvider>().changeisDarkMode();
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
