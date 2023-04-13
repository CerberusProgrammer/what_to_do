import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'data/constants.dart';
import 'home.dart';

class Presentation extends StatelessWidget {
  Presentation({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: "",
      bodyWidget: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome to ',
              style: TextStyle(fontSize: 28),
            ),
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts:
                  List.generate(textPresentationIntro.length, (index) {
                return TypewriterAnimatedText(
                  textPresentationIntro[index],
                  textStyle: GoogleFonts.anton(fontSize: 32),
                  speed: const Duration(milliseconds: 100),
                );
              }),
            ),
          ],
        ),
      ),
    ),
    PageViewModel(
      title: '1',
      bodyWidget: const Text(
          "Welcome to the ultimate task management platform to help you stay organized, focused, and motivated to do new things in your life!"),
    ),
    PageViewModel(title: '2', bodyWidget: const Text('a')),
    PageViewModel(title: '3', bodyWidget: const Text('a')),
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
        showNextButton: true,
        showBackButton: true,
        done: const Text("Done"),
        onDone: () {
          _onIntroEnd(context);
        },
        back: const Icon(Icons.arrow_back),
        next: const Icon(Icons.arrow_forward));
  }
}
