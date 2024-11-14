import 'package:contect_dlary_app/screens/android/homepage/home_provider/homeprovider.dart';
import 'package:contect_dlary_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage('lib/assets/image/1.jpg'),
            ),
            const SizedBox(height: 60),
            TextField(
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 50),
            ListTile(
              title: const Text('Platform'),
              trailing: Switch(
                value: context.watch<ContactProvider>().isAndiroid,
                onChanged: (value) {
                  context.read<ContactProvider>().changeisAndiroid();
                },
              ),
            ),
            10.height,
            ListTile(
              title: const Text('Theme'),
              trailing: Switch(
                value: context.watch<ContactProvider>().isdarkmode,
                onChanged: (value) {
                  context.read<ContactProvider>().changeisDarkMode();
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
