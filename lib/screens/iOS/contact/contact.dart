import 'dart:io';

import 'package:contect_dlary_app/screens/android/homepage/home_provider/homeprovider.dart';
import 'package:contect_dlary_app/screens/android/homepage/model/model.dart';
import 'package:contect_dlary_app/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class iOSContact extends StatefulWidget {
  const iOSContact({super.key});

  @override
  State<iOSContact> createState() => _iOSContactState();
}

class _iOSContactState extends State<iOSContact> {
  int currentStep = 0;
  String? imagePath;

  TextEditingController txtname = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Contact'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Text('Save'),
          onPressed: () {
            String name = txtname.text;
            String email = txtemail.text;
            String phone = txtphone.text;

            ContactModel contact = ContactModel(
              name: name,
              number: phone,
              email: email,
              image: imagePath,
            );
            context.read<ContactProvider>().addcontact(contact);
            Navigator.pop(context);
            txtname.clear();
            txtphone.clear();
            txtemail.clear();
            imagePath = null;
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          right: 16,
          bottom: 16,
          left: 16,
        ),
        child: Center(
          child: ListView(
            children: [
              (imagePath == null)
                  ? const CircleAvatar(
                      radius: 90,
                    )
                  : CircleAvatar(
                      radius: 90,
                      backgroundImage: FileImage(
                        File(imagePath!),
                      ),
                    ),
              10.height,
              CupertinoButton(
                onPressed: () {
                  showCupertinoDialog(
                    // barrierDismissible: false,
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text("Select Image Source"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CupertinoListTile(
                            leading: const Icon(Icons.camera),
                            title: const Text("Camera"),
                            onTap: () async {
                              ImagePicker imagePicker = ImagePicker();
                              XFile? xfile = await imagePicker.pickImage(
                                  source: ImageSource.camera);

                              imagePath = xfile!.path;
                              setState(() {});
                              Navigator.of(context).pop();
                            },
                          ),
                          CupertinoListTile(
                            leading: const Icon(Icons.photo),
                            title: const Text("Gallery"),
                            onTap: () async {
                              ImagePicker imagePicker = ImagePicker();
                              XFile? xfile = await imagePicker.pickImage(
                                  source: ImageSource.gallery);

                              imagePath = xfile!.path;
                              setState(() {});
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Add Image',
                ),
              ),
              50.height,
              CupertinoTextField(
                controller: txtname,
                placeholder: 'Name',
                padding: const EdgeInsets.all(16),
                keyboardType: TextInputType.name,
              ),
              20.height,
              CupertinoTextField(
                controller: txtphone,
                maxLength: 10,
                placeholder: 'Phone',
                padding: const EdgeInsets.all(16),
                keyboardType: TextInputType.phone,
              ),
              20.height,
              CupertinoTextField(
                controller: txtemail,
                placeholder: 'Email',
                padding: const EdgeInsets.all(16),
                keyboardType: TextInputType.emailAddress,
              ),
              50.height,
            ],
          ),
        ),
      ),
    );
  }
}
