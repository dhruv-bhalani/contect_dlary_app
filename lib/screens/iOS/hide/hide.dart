import 'package:flutter/cupertino.dart';

class iOSHide extends StatefulWidget {
  const iOSHide({super.key});

  @override
  State<iOSHide> createState() => _iOSHideState();
}

class _iOSHideState extends State<iOSHide> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Hide'),
      ),
      child: Container(),
    );
  }
}
