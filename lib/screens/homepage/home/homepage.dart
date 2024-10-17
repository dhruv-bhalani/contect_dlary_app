import 'dart:io';

import 'package:contect_dlary_app/screens/homepage/home_provider/homeprovider.dart';
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
        title: const Center(child: Text('Home')),
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
              style: TextStyle(fontSize: 15),
            ),
            leading: CircleAvatar(
              radius: 20,
              foregroundImage: FileImage(
                File(
                    context.watch<ContactProvider>().Contactlist[index].image ??
                        ''),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/addcontact');
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
