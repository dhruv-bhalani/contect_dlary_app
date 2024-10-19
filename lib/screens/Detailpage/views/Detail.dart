import 'dart:io';

import 'package:contect_dlary_app/screens/homepage/home_provider/homeprovider.dart';
import 'package:contect_dlary_app/screens/homepage/model/model.dart';
import 'package:contect_dlary_app/utils/extension.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  String? imagePath;

  TextEditingController txtname = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Contactmodel detail =
        ModalRoute.of(context)!.settings.arguments as Contactmodel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<ContactProvider>().Favoritecontact(detail);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {
              context.read<ContactProvider>().hidecontact(detail);
              Navigator.pop(context);
            },
            icon: const Icon(Icons.lock),
          ),
          IconButton(
            onPressed: () {
              // txtname.text = detail.name!;
              // txtphone.text = detail.number!;
              // txtemail.text = detail.email!;
              showDialog(
                  context: context,
                  builder: (context) {
                    detail.name = txtname.text;
                    detail.number = txtphone.text;
                    detail.email = txtemail.text;
                    return AlertDialog(
                      actions: [
                        10.height,
                        const Center(
                          child: Text("Edit"),
                        ),
                        10.height,
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: txtname,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelText: 'Name',
                          ),
                        ),
                        10.height,
                        TextFormField(
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          controller: txtphone,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelText: 'Number',
                          ),
                        ),
                        10.height,
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: txtemail,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelText: 'Email',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Contactmodel contact = Contactmodel(
                              name: txtname.text,
                              number: txtphone.text,
                              email: txtemail.text,
                              image: detail.image,
                            );
                            context
                                .watch<ContactProvider>()
                                .updatecontact(contact);
                          },
                          child: const Text('update'),
                        ),
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CircleAvatar(
              radius: 70,
              // child: Text("${detail.name?.substring(0, 1)}",
              //     style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              foregroundImage: FileImage(
                File(detail.image ?? ''),
              ),
            ),
            40.height,
            const Text(
              "Name",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text("${detail.name}"),
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
              ),
            ),
            10.height,
            const Text(
              'Number',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text("${detail.number}"),
              leading: IconButton(
                onPressed: () async {
                  Uri phone = Uri.parse('tel:${detail.number}');
                  await launchUrl(phone);
                },
                icon: const Icon(Icons.phone),
              ),
            ),
            10.height,
            const Text(
              'Email',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text("${detail.email}"),
              leading: IconButton(
                onPressed: () async {
                  Uri email = Uri.parse('mailto:${detail.email}');
                  await launchUrl(email);
                },
                icon: const Icon(Icons.email),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
