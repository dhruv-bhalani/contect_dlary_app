import 'dart:io';

import 'package:contect_dlary_app/screens/android/homepage/home_provider/homeprovider.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () async {
              bool islock = await context.read<ContactProvider>().LockContact();
              if (islock) {
                Navigator.pushNamed(context, '/hide');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Contact Locked'),
                  ),
                );
              }
            },
            icon: const Icon(Icons.lock),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/favorites');
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<ContactProvider>().Contactlist.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              context.read<ContactProvider>().setSelectedIndex(index);
              Navigator.of(context).pushNamed('/Detail',
                  arguments:
                      context.read<ContactProvider>().Contactlist[index]);
            },
            onLongPress: () {
              context.read<ContactProvider>().deletecontact(index);
            },
            title: Text(
                "${context.watch<ContactProvider>().Contactlist[index].name}"),
            subtitle: Text(
              "${context.watch<ContactProvider>().Contactlist[index].number}",
              style: const TextStyle(fontSize: 15),
            ),
            leading: CircleAvatar(
              radius: 20,
              foregroundImage: FileImage(
                File(
                    context.watch<ContactProvider>().Contactlist[index].image!),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/addcontact');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
