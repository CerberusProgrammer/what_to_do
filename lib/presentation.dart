import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'home.dart';

class Presentation extends StatelessWidget {
  Presentation({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Title of custom body page",
      bodyWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Click on "),
          Icon(Icons.edit),
          Text(" to edit a post"),
        ],
      ),
      image: const Center(
        child: Icon(Icons.android),
      ),
    ),
  ];

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: pages,
      showNextButton: false,
      done: const Text("Done"),
      onDone: () {
        _onIntroEnd(context);
      },
    );
  }
}
