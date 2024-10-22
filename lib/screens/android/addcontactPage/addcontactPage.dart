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
              Navigator.of(context).pushNamed('/countar');
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Theme(
          data: ThemeData(
            scaffoldBackgroundColor: Colors.green.shade600,
            shadowColor: Colors.green.shade600,
            // primaryColor: Colors.red,
            cardColor: Colors.green.shade600,
            hoverColor: Colors.green.shade600,
            splashColor: Colors.green.shade600,
            canvasColor: Colors.green.shade600,
            disabledColor: Colors.green.shade600,
            dividerColor: Colors.green.shade600,
            highlightColor: Colors.green.shade600,
            colorSchemeSeed: Colors.green.shade600,
          ),
          child: Stepper(
            currentStep: currentStep,
            connectorColor: WidgetStatePropertyAll(Colors.green.shade600),
            onStepContinue: () {
              if (currentStep < 4) {
                setState(() {
                  currentStep++;
                });
              }
            },
            onStepCancel: () {
              if (currentStep > 0) {
                setState(() {
                  currentStep--;
                });
              }
            },
            steps: [
              Step(
                title: const Text('Step 1'),
                content: Column(
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
                      child: const Text(
                        'Select Image',
                      ),
                    ),
                  ],
                ),
              ),
              Step(
                title: const Text('Step 2'),
                content: TextField(
                  controller: txtname,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    labelText: 'name',
                  ),
                ),
              ),
              Step(
                title: const Text('Step 3'),
                content: TextField(
                  controller: txtemail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    labelText: 'Email',
                  ),
                ),
              ),
              Step(
                title: const Text('Step 4'),
                content: TextField(
                  controller: txtphone,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    labelText: 'Phone',
                  ),
                ),
              ),
              Step(
                title: const Text('Step 5'),
                content: ElevatedButton(
                  onPressed: () {
                    String name = txtname.text;
                    String email = txtemail.text;
                    String phone = txtphone.text;

                    Contactmodel contact = Contactmodel(
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
                  child: const Text('save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
