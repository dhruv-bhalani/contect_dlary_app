import 'dart:io';

import 'package:contect_dlary_app/screens/android/homepage/model/model.dart';
import 'package:contect_dlary_app/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class IosDetailPage extends StatefulWidget {
  const IosDetailPage({super.key});

  @override
  State<IosDetailPage> createState() => _IosDetailPageState();
}

class _IosDetailPageState extends State<IosDetailPage> {
  @override
  Widget build(BuildContext context) {
    ContactModel detail =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Add Contact"),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (detail.image == null)
                ? const CircleAvatar(
                    radius: 80,
                  )
                : CircleAvatar(
                    radius: 80,
                    backgroundImage: FileImage(
                      File(detail.image!),
                    ),
                  ),
            10.height,
            CupertinoButton(
              onPressed: () {
                showCupertinoModalPopup(
                  // barrierDismissible: false,
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text("Select Image Source"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CupertinoListTile(
                          leading: Icon(CupertinoIcons.camera),
                          title: const Text("Camera"),
                          onTap: () async {
                            ImagePicker imagePicker = ImagePicker();
                            XFile? xfile = await imagePicker.pickImage(
                                source: ImageSource.camera);
                            detail.image = xfile!.path;

                            Navigator.of(context).pop();
                          },
                        ),
                        CupertinoListTile(
                          leading: const Icon(CupertinoIcons.photo),
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
              child: Icon(CupertinoIcons.add_circled, size: 40.0),
            ),
          ],
        ),
      ),
    );
  }
}
