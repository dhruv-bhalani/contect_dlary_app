import 'package:contect_dlary_app/utils/shrHelper.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends StatefulWidget {
  const Introduction({super.key});

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome",
            body: "This is the body text",
            image: Image.asset("lib/assets/image/3.jpg"),
          ),
          PageViewModel(
            title: "Hello",
            body: "",
            image: Image.asset('lib/assets/image/5.jpg'),
          ),
          PageViewModel(
            title: "Coding",
            body: "",
            image: Image.asset('lib/assets/image/4.jpg'),
          ),
        ],
        done: const Text('Done'),
        next: const Text('Next'),
        skip: const Text('Skip'),
        onDone: () {
          ShrHelper s = ShrHelper();
          s.shareIntro();
          Navigator.of(context).pushReplacementNamed('/home');
        },
        // onSkip: () {},
        showSkipButton: true,
      ),
    );
  }
}
