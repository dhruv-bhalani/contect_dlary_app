import 'dart:io';

import 'package:contect_dlary_app/screens/android/homepage/home_provider/homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Contact'),
      ),
      body: ListView.builder(
        itemCount: context.watch<ContactProvider>().favoriteContact.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/Detail',
                  arguments:
                      context.read<ContactProvider>().favoriteContact[index]);
            },
            onLongPress: () {
              context.read<ContactProvider>().unfavoritecontact(
                  context.read<ContactProvider>().favoriteContact[index]);
            },
            trailing: IconButton(
              onPressed: () {
                context.read<ContactProvider>().favoritedeletecontact(index);
              },
              icon: const Icon(Icons.delete),
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
                        .image ??
                    ''),
              ),
            ),
          );
        },
      ),
    );
  }
}
