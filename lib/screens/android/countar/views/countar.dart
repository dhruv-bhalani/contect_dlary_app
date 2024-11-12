import 'package:contect_dlary_app/screens/android/countar/countar_provider/countar_provider.dart';
import 'package:contect_dlary_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Countar extends StatefulWidget {
  const Countar({super.key});

  @override
  State<Countar> createState() => _CountarState();
}

class _CountarState extends State<Countar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          Text(
            context.watch<countar>().count.toString(),
          ),
          Text(
            context.watch<countar>().count2.toString(),
          ),
          Text(
            context.watch<countar>().count3.toString(),
          ),
          Text(
            context.watch<countar>().count4.toString(),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<countar>().increment();
                },
                child: const Text('+'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<countar>().decrement();
                },
                child: const Text('-'),
              ),
            ],
          ),
          40.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<countar>().x2();
                },
                child: const Text('x2'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<countar>().x3();
                },
                child: const Text('x3'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<countar>().x4();
                },
                child: const Text('x4'),
              ),
            ],
          ),
          40.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<countar>().reset();
                },
                child: const Icon(Icons.restart_alt),
              ),
              20.width,
            ],
          ),
          const Spacer(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/intro');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
