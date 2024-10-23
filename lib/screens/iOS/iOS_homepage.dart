import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:contect_dlary_app/utils/extension.dart';
import 'package:contect_dlary_app/screens/android/homepage/home_provider/homeprovider.dart';

class IosHomepage extends StatefulWidget {
  const IosHomepage({super.key});

  @override
  State<IosHomepage> createState() => _IosHomepageState();
}

class _IosHomepageState extends State<IosHomepage> {
  @override
  Widget build(BuildContext context) {
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
              title: Text("Paras"),
              message: Text("Are you sure you want to delete this contact?"),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () {},
                  child: Text('Lock Contact'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () async {},
                  child: Text('Lock Contact'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () async {},
                  child: Text('Lock Contact'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
