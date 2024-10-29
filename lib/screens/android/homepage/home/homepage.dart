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
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late ContactProvider cR = ContactProvider();
  late ContactProvider cW = ContactProvider();
  @override
  Widget build(BuildContext context) {
    cR = context.read<ContactProvider>();
    cW = context.watch<ContactProvider>();
    return Scaffold(
      key: scaffoldKey,
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
            onPressed: () async {
              bool islock = await context.read<ContactProvider>().LockContact();
              if (islock) {
                Navigator.pushNamed(context, '/favorites');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Contact Locked'),
                  ),
                );
              }
            },
            icon: const Icon(Icons.star),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Select Theme"),
                    content: Row(
                      children: [
                        Switch(
                          value: context.watch<ContactProvider>().isAndiroid,
                          onChanged: (value) {
                            context.read<ContactProvider>().changeisAndiroid();
                          },
                        ),
                        Spacer(),
                        Switch(
                          value: context.watch<ContactProvider>().isdarkmode,
                          onChanged: (value) {
                            context.read<ContactProvider>().changeisDarkMode();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: context.watch<ContactProvider>().contactList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    context.read<ContactProvider>().setSelectedIndex(index);
                    Navigator.of(context).pushNamed('/Detail',
                        arguments:
                            context.read<ContactProvider>().contactList[index]);
                  },
                  onLongPress: () {
                    context.read<ContactProvider>().deletecontact(index);
                  },
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
          // ElevatedButton(
          //   onPressed: () {
          //     showModalBottomSheet(
          //       context: context,
          //       builder: (context) {
          //         return Container(
          //           height: 200,
          //           color: Colors.white,
          //           child: const Center(
          //             child: Text('dhruv'),
          //           ),
          //         );
          //       },
          //     );
          //   },
          //   child: const Text("Add Contact"),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     scaffoldKey.currentState!.showBottomSheet(
          //       (context) {
          //         return Container(
          //           height: 200,
          //           color: Colors.white,
          //           child: const Center(
          //             child: Text("Dhruv"),
          //           ),
          //         );
          //       },
          //     );
          //   },
          //   child: const Text("Add Contact"),
          // ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/addcontact');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
