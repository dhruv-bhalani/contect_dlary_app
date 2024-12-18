import 'dart:io';

import 'package:contect_dlary_app/screens/android/homepage/home_provider/homeprovider.dart';
import 'package:contect_dlary_app/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class iOSHomepage extends StatefulWidget {
  const iOSHomepage({super.key});

  @override
  State<iOSHomepage> createState() => _iOSHomepageState();
}

class _iOSHomepageState extends State<iOSHomepage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pushNamed('/countars');
          },
          child: const Icon(Icons.add),
        ),
        middle: const Text('Home'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.of(context).pushNamed('/profile');
          },
          //   showCupertinoDialog(
          //     context: context,
          //     builder: (context) {
          //       return CupertinoAlertDialog(
          //         actions: [
          //           const Center(child: Text('Plat form')),
          //           CupertinoSwitch(
          //             value:
          //             onChanged: (value) {
          //
          //             },
          //           ),
          //           10.height,
          //           const Center(child: Text('Theme')),
          //           CupertinoSwitch(
          //             value:
          //             onChanged: (value) {
          //               context.read<ContactProvider>().changeisDarkMode();
          //               Navigator.pop(context);
          //             },
          //           ),
          //         ],
          //       );
          //     },
          //   );
          // },
          child: const Icon(Icons.person),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<ContactProvider>().contactList.length,
              itemBuilder: (context, index) {
                return CupertinoListTile(
                  onTap: () {
                    context.read<ContactProvider>().setSelectedIndex(index);
                    Navigator.of(context).pushNamed('/iOSDetail',
                        arguments:
                            context.read<ContactProvider>().contactList[index]);
                  },
                  trailing: CupertinoButton(
                    onPressed: () {
                      context.read<ContactProvider>().deletecontact(index);
                    },
                    child: const Icon(CupertinoIcons.delete),
                  ),
                  title: Text(
                      "${context.watch<ContactProvider>().contactList[index].name}"),
                  subtitle: Text(
                    "${context.watch<ContactProvider>().contactList[index].number}",
                    style: const TextStyle(fontSize: 15),
                  ),
                  leading: CircleAvatar(
                    radius: 20,
                    foregroundImage: FileImage(
                      File(context
                          .watch<ContactProvider>()
                          .contactList[index]
                          .image!),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
