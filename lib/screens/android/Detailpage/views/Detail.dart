import 'dart:io';

import 'package:contect_dlary_app/screens/android/homepage/home_provider/homeprovider.dart';
import 'package:contect_dlary_app/screens/android/homepage/model/model.dart';
import 'package:contect_dlary_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtemail = TextEditingController();

  late ContactProvider cW = ContactProvider();
  late ContactProvider cR = ContactProvider();
  @override
  Widget build(BuildContext context) {
    cR = context.read<ContactProvider>();
    cW = context.watch<ContactProvider>();
    ContactModel detail =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    context.watch<ContactProvider>().imagePath = detail.image;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: const Text(
          'Detail',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              txtname.text = detail.name!;
              txtphone.text = detail.number!;
              txtemail.text = detail.email!;
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        20.height,
                        Center(
                          child: Row(
                            children: [
                              const Text(
                                "Edit",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              10.width,
                              const Icon(Icons.edit),
                            ],
                          ),
                        ),
                        20.height,
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
                            ContactModel contact = ContactModel(
                              name: txtname.text,
                              number: txtphone.text,
                              email: txtemail.text,
                              image: detail.image,
                            );
                            context
                                .read<ContactProvider>()
                                .updatecontact(contact);
                            Navigator.pop(context);
                          },
                          child: const Text('Update'),
                        ),
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
              onPressed: () {
                Share.share(
                    'Name: ${detail.name}\nNumber: ${detail.number}\nEmail: ${detail.email}');
              },
              icon: Icon(Icons.share))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  (detail.image == null)
                      ? const CircleAvatar(
                          radius: 90,
                        )
                      : CircleAvatar(
                          radius: 90,
                          backgroundImage: FileImage(
                            File(detail.image!),
                          ),
                        ),
                  10.height,
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        // barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Select Image Source"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: const Icon(Icons.camera),
                                title: const Text("Camera"),
                                onTap: () async {
                                  ImagePicker imagePicker = ImagePicker();
                                  XFile? xfile = await imagePicker.pickImage(
                                      source: ImageSource.camera);
                                  detail.image = xfile!.path;

                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.photo),
                                title: const Text("Gallery"),
                                onTap: () async {
                                  ImagePicker imagePicker = ImagePicker();
                                  XFile? xfile = await imagePicker.pickImage(
                                      source: ImageSource.gallery);

                                  detail.image = xfile!.path;
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Upload Image',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            40.height,
            const Text(
              "Name",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              // onTap: () {
              //   Uri phone = Uri.parse(':${detail.number}');
              // },
              title: Text("${detail.name}"),
              leading: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
            ),
            10.height,
            const Text(
              'Number',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              onTap: () async {
                Uri phone = Uri.parse('tel:${detail.number}');
                await launchUrl(phone);
              },
              title: Text("${detail.number}"),
              leading: const Icon(
                Icons.phone,
                color: Colors.blue,
              ),
            ),
            10.height,
            const Text(
              'Email',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              onTap: () async {
                Uri email = Uri.parse('mailto:${detail.email}');
                await launchUrl(email);
              },
              title: Text("${detail.email}"),
              leading: const Icon(
                Icons.email,
                color: Colors.blue,
              ),
            ),
            const Text(
              'Message',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              onTap: () async {
                Uri sms = Uri.parse('sms:${detail.number}');
                await launchUrl(sms);
              },
              title: Text("${detail.number}"),
              leading: const Icon(
                Icons.message,
                color: Colors.blue,
              ),
            ),
            15.height,
            TextButton.icon(
              onPressed: () async {
                DateTime? dT = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(3000),
                );
                cW.changeDatetime(dT!);
              },
              label: Row(
                children: [
                  const Text(
                    "Date",
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  const Spacer(),
                  Text(
                    "${cR.date.day}/${cR.date.month}/${cR.date.year}",
                    style: TextStyle(color: Colors.blue.shade600),
                  )
                ],
              ),
              icon: const Icon(
                Icons.date_range,
                color: Colors.blue,
              ),
            ),
            TextButton.icon(
              onPressed: () async {
                TimeOfDay? T1 = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                cW.changeTime(T1!);
              },
              label: Row(
                children: [
                  const Text(
                    "Time",
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  const Spacer(),
                  Text(
                    "${cR.t1.hour}:${cR.t1.minute}",
                    style: TextStyle(color: Colors.blue.shade600),
                  )
                ],
              ),
              icon: const Icon(
                Icons.timer,
                size: 25,
                color: Colors.blue,
              ),
            ),
            20.height,
          ],
        ),
      ),
    );
  }
}
