import 'package:contect_dlary_app/utils/extension.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    TextEditingController txtname = TextEditingController();
    TextEditingController txtphone = TextEditingController();
    TextEditingController txtemail = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: txtname,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                labelText: 'Name',
              ),
            ),
            5.height,
            TextField(
              controller: txtphone,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                labelText: 'Number',
              ),
            ),
            5.height,
            TextField(
              controller: txtemail,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                labelText: 'Email',
              ),
            ),
            20.height,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                10.width,
                ElevatedButton(
                  onPressed: () {},
                  child: Text('update'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
