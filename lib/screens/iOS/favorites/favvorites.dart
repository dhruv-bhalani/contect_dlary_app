import 'dart:developer';
import 'dart:io';

import 'package:contect_dlary_app/screens/android/homepage/home_provider/homeprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Favorites'),
      ),
      child: ListView.builder(
        itemCount: context.watch<ContactProvider>().favoriteContact.length,
        itemBuilder: (context, index) {
          return CupertinoListTile(
            onTap: () {
              context.read<ContactProvider>().setSelectedIndex(index);
              Navigator.of(context).pushNamed('/iOSDetail',
                  arguments:
                      context.read<ContactProvider>().favoriteContact[index]);
            },
            trailing: CupertinoButton(
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      actions: [
                        CupertinoButton(
                          child: const Icon(Icons.delete),
                          onPressed: () {
                            context
                                .read<ContactProvider>()
                                .favoritedeletecontact(index);
                            Navigator.pop(context);
                          },
                        ),
                        CupertinoButton(
                          child: const Icon(Icons.home),
                          onPressed: () {
                            context.read<ContactProvider>().unfavoritecontact(
                                  context
                                      .read<ContactProvider>()
                                      .favoriteContact[index],
                                );
                            context.read<ContactProvider>().contactList.add(
                                  context
                                      .read<ContactProvider>()
                                      .favoriteContact[index],
                                );
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Icon(CupertinoIcons.clear),
            ),
            title: Text(
                "${context.watch<ContactProvider>().favoriteContact[index].name}"),
            subtitle: Text(
              "${context.watch<ContactProvider>().favoriteContact[index].number}",
              style: const TextStyle(fontSize: 15),
            ),
            leading: CircleAvatar(
              radius: 20,
              foregroundImage: FileImage(
                File(context
                    .watch<ContactProvider>()
                    .favoriteContact[index]
                    .image!),
              ),
            ),
          );
        },
      ),
    );
  }
}
