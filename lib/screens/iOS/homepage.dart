import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:contect_dlary_app/screens/android/homepage/home_provider/homeprovider.dart';

class iOSHomepage extends StatefulWidget {
  const iOSHomepage({super.key});

  @override
  State<iOSHomepage> createState() => _iOSHomepageState();
}

late ContactProvider cR = ContactProvider();
late ContactProvider cW = ContactProvider();

class _iOSHomepageState extends State<iOSHomepage> {
  @override
  Widget build(BuildContext context) {
    cR = context.read<ContactProvider>();
    cW = context.watch<ContactProvider>();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: CupertinoSwitch(
          value: context.watch<ContactProvider>().isAndiroid,
          onChanged: (value) {
            context.read<ContactProvider>().changeisAndiroid();
          },
        ),
        middle: const Text('iOS Homepage'),
        leading: CupertinoButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.home),
        ),
        automaticallyImplyLeading: true,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActionSheet(
              title: const Text("ok"),
              message: const Text("Om\t&\tkrisha(kg)"),
              actions: [
                CupertinoButton(
                  child:
                      Text("${cR.date.day}/${cR.date.month}/${cR.date.year}"),
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 300,
                          width: 600,
                          color: Colors.white,
                          child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (value) {
                                cW.changeDatetime(value);
                              },
                              initialDateTime: DateTime.now(),
                              minimumYear: 1900,
                              maximumYear: 3000),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
