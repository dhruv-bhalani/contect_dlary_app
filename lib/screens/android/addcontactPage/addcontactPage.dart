import 'dart:io';

import 'package:contect_dlary_app/screens/android/homepage/home_provider/homeprovider.dart';
import 'package:contect_dlary_app/screens/android/homepage/model/model.dart';
import 'package:contect_dlary_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Addcontactpage extends StatefulWidget {
  const Addcontactpage({super.key});

  @override
  State<Addcontactpage> createState() => _AddcontactpageState();
}

class _AddcontactpageState extends State<Addcontactpage> {
  int currentStep = 0;
  String? imagePath;

  TextEditingController txtname = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtemail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              String name = txtname.text;
              String email = txtemail.text;
              String phone = txtphone.text;
              File image = File(imagePath!);

              ContactModel contact = ContactModel(
                name: name,
                number: phone,
                email: email,
                image: imagePath,
              );
              context.read<ContactProvider>().addcontact(contact);
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Added Successfully"),
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: Colors.white,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
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

                              imagePath = xfile!.path;
                              setState(() {});
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
                child: const Icon(Icons.add_a_photo),
              ),
              50.height,
              TextFormField(
                controller: txtname,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  labelText: 'name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              20.height,
              TextFormField(
                controller: txtphone,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  labelText: 'Phone',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              10.height,
              TextFormField(
                controller: txtemail,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
