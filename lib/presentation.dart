import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/constants.dart';
import 'home.dart';

class Presentation extends StatelessWidget {
  Presentation({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      titleWidget: const SizedBox(),
      bodyWidget: Column(
        children: [
          const Text(
            'Welcome to ',
            style: TextStyle(fontSize: 28),
          ),
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: List.generate(textPresentationIntro.length, (index) {
              return TypewriterAnimatedText(
                textPresentationIntro[index],
                textStyle: GoogleFonts.anton(fontSize: 36),
                speed: const Duration(milliseconds: 100),
              );
            }),
          ),
        ],
      ),
      decoration: const PageDecoration(bodyAlignment: Alignment.center),
    ),
    PageViewModel(
      title: '',
      bodyWidget: AnimatedTextKit(
        isRepeatingAnimation: false,
        totalRepeatCount: 1,
        animatedTexts: List.generate(textPresentationIntro.length, (index) {
          return TypewriterAnimatedText(
            "The ultimate task management platform to help you stay organized, focused, and motivated to do new things in your life!",
            textStyle: GoogleFonts.anton(fontSize: 36),
            speed: const Duration(milliseconds: 100),
            textAlign: TextAlign.center,
          );
        }),
      ),
      decoration: const PageDecoration(
        bodyAlignment: Alignment.center,
      ),
    ),
    PageViewModel(title: 'Select a theme for you', bodyWidget: const Text('a')),
    PageViewModel(title: 'Tell us your name', bodyWidget: const Text('a')),
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
      onDone: () async {
        final prefs = await SharedPreferences.getInstance();
        prefs.setBool('presentation', false);
        _onIntroEnd(context);
      },
      back: const Icon(Icons.arrow_back),
      next: const Icon(Icons.arrow_forward),
    );
  }
}
