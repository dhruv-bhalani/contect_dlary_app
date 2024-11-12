import 'package:flutter/material.dart';

class Sliver extends StatefulWidget {
  const Sliver({super.key});

  @override
  State<Sliver> createState() => _SliverState();
}

class _SliverState extends State<Sliver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            title: const Text(
              'Sliver',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'lib/assets/image/4.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList.builder(
            itemCount: 20,
            itemBuilder: (context, index) => ListTile(
              title: Text('Item $index'),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.blue,
              child: const Text('SliverToBoxAdapter'),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              color: Colors.yellow,
              child: const Text('SliverToBoxAdapter'),
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
