import 'dart:io';

import 'package:contect_dlary_app/screens/android/homepage/home_provider/homeprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class iOSFavvorites extends StatefulWidget {
  const iOSFavvorites({super.key});

  @override
  State<iOSFavvorites> createState() => _iOSFavvoritesState();
}

class _iOSFavvoritesState extends State<iOSFavvorites> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Favorites'),
        trailing: CupertinoSwitch(
          value: context.watch<ContactProvider>().isAndiroid,
          onChanged: (value) {
            context.read<ContactProvider>().changeisAndiroid();
          },
        ),
        leading: CupertinoButton(
          child: const Icon(CupertinoIcons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/countars');
          },
        ),
      ),
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
                File(
                    context.watch<ContactProvider>().contactList[index].image!),
              ),
            ),
          );
        },
      ),
    );
  }
}