import 'dart:io';

import 'package:contect_dlary_app/screens/android/homepage/home_provider/homeprovider.dart';
import 'package:contect_dlary_app/screens/android/homepage/model/model.dart';
import 'package:contect_dlary_app/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class iOSDetailPage extends StatefulWidget {
  const iOSDetailPage({super.key});

  @override
  State<iOSDetailPage> createState() => _iOSDetailPageState();
}

class _iOSDetailPageState extends State<iOSDetailPage> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtphone = TextEditingController();
  TextEditingController txtemail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ContactModel detail =
        ModalRoute.of(context)!.settings.arguments as ContactModel;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Text('Edit'),
          onPressed: () {
            txtname.text = detail.name!;
            txtphone.text = detail.number!;
            txtemail.text = detail.email!;
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                actions: [
                  10.height,
                  const Center(
                    child: Text("Edit"),
                  ),
                  10.height,
                  CupertinoTextField(
                    keyboardType: TextInputType.name,
                    controller: txtname,
                    autofillHints: const [AutofillHints.name],
                  ),
                  10.height,
                  CupertinoTextField(
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    controller: txtphone,
                  ),
                  10.height,
                  CupertinoTextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: txtemail,
                    autofillHints: const [AutofillHints.email],
                  ),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('cancel'),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      ContactModel contact = ContactModel(
                        name: txtname.text,
                        number: txtphone.text,
                        email: txtemail.text,
                        image: detail.image,
                      );
                      context.read<ContactProvider>().updatecontact(contact);
                      Navigator.pop(context);
                    },
                    child: const Text('update'),
                  ),
                ],
              ),
            );
          },
        ),
        middle: const Text("Detail"),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: ListView(
          children: [
            (detail.image == null)
                ? const Center(
                    child: CircleAvatar(
                      radius: 80,
                    ),
                  )
                : Center(
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: FileImage(
                        File(detail.image!),
                      ),
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
                          leading: const Icon(CupertinoIcons.camera),
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
              child: const Text("Add Photo"),
            ),
            50.height,
            CupertinoListTile(
              title: Text('${detail.name}'),
              leading: const Icon(CupertinoIcons.person),
            ),
            10.height,
            CupertinoListTile(
              onTap: () async {
                Uri phoneno = Uri.parse('tel:${detail.number}');
                await launchUrl(phoneno);
              },
              title: Text('${detail.number}'),
              leading: const Icon(CupertinoIcons.phone),
            ),
            10.height,
            CupertinoListTile(
              onTap: () async {
                Uri email = Uri.parse('mailto:${detail.email}');
                await launchUrl(email);
              },
              title: Text('${detail.email}'),
              leading: const Icon(CupertinoIcons.mail),
            ),
            10.height,
            CupertinoListTile(
              onTap: () async {
                Uri email = Uri.parse('sms:${detail.number}');
                await launchUrl(email);
              },
              title: Text('${detail.number}'),
              leading: const Icon(Icons.sms_outlined),
            ),
            225.height,
            Row(
              children: [
                CupertinoButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/favorites');
                  },
                  child: Icon(CupertinoIcons.star),
                ),
                60.width,
                CupertinoButton(
                  onPressed: () {
                    Share.share(
                        'Name: ${detail.name}\nNumber: ${detail.number}\nEmail: ${detail.email}');
                  },
                  child: Icon(CupertinoIcons.share_up),
                ),
                60.width,
                CupertinoButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Icon(Icons.access_time_outlined),
                ),
                60.width,
                CupertinoButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/hide');
                  },
                  child: Icon(CupertinoIcons.bookmark),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
