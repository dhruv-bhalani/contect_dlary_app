import 'dart:io';

import 'package:contect_dlary_app/screens/android/homepage/home_provider/homeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Hide extends StatefulWidget {
  const Hide({super.key});

  @override
  State<Hide> createState() => _HideState();
}

class _HideState extends State<Hide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hide Contact'),
      ),
      body: ListView.builder(
        itemCount: context.watch<ContactProvider>().privateContact.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/Detail',
                  arguments:
                      context.read<ContactProvider>().privateContact[index]);
            },
            onLongPress: () {
              context.read<ContactProvider>().unhidecontact(
                  context.read<ContactProvider>().privateContact[index]);
            },
            trailing: IconButton(
              onPressed: () {
                context.read<ContactProvider>().hidedeletecontact(index);
              },
              icon: const Icon(Icons.delete),
            ),
            title: Text(
                "${context.watch<ContactProvider>().privateContact[index].name}"),
            subtitle: Text(
              "${context.watch<ContactProvider>().privateContact[index].number}",
              style: const TextStyle(fontSize: 15),
            ),
            leading: CircleAvatar(
              radius: 20,
              foregroundImage: FileImage(
                File(context
                        .watch<ContactProvider>()
                        .privateContact[index]
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
