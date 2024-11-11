import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class iOSSliver extends StatefulWidget {
  const iOSSliver({super.key});

  @override
  State<iOSSliver> createState() => _iOSSliverState();
}

class _iOSSliverState extends State<iOSSliver> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: const Text('Sliver'),
          ),
          SliverList.builder(
            itemCount: 10,
            itemBuilder: (context, index) => CupertinoListTile(
              leading: Text('$index'),
              title: Text('Item $index'),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.redAccent,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.yellow.shade900,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.primaries[index % Colors.primaries.length],
              ),
              childCount: Colors.primaries.length,
            ),
          ),
        ],
      ),
    );
  }
}
