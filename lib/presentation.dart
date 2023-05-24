import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:what_to_do/object/user.dart';
import 'package:what_to_do/style/themes.dart';

import 'data/constants.dart';
import 'home.dart';

class Presentation extends StatefulWidget {
  const Presentation({super.key});

  @override
  State<Presentation> createState() => _PresentationState();
}

class _PresentationState extends State<Presentation> {
  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
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
                animatedTexts:
                    List.generate(textPresentationIntro.length, (index) {
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
            pause: const Duration(seconds: 30),
            animatedTexts: List.generate(textPresentationIntro.length, (index) {
              return TypewriterAnimatedText(
                "The ultimate task management platform to help you stay organized, focused, and motivated to do new things in your life.",
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
        PageViewModel(
            title: 'Select a theme for you',
            bodyWidget: GridView.count(
              crossAxisCount: 6,
              shrinkWrap: true,
              children: List.generate(
                Themes.colors.length,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Themes.colors[index],
                        side: const BorderSide(
                            color: Color.fromARGB(70, 35, 35, 35), width: 8),
                      ),
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setInt('defaultIndex', index);

                        setState(() {
                          AdaptiveTheme.of(context).setTheme(
                            light: Themes.changeTheme(index),
                            dark: Themes.changeTheme(index),
                          );
                        });
                      },
                      child: null,
                    ),
                  );
                },
              ),
            ),
            decoration: const PageDecoration(
              bodyAlignment: Alignment.center,
            )),
        PageViewModel(
            title: 'Tell us your name',
            bodyWidget: SizedBox(
              width: 300,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(),
                onSubmitted: (value) {
                  setState(() {
                    User.mainUser.name = value;
                  });
                },
              ),
            ),
            decoration: const PageDecoration(bodyAlignment: Alignment.center)),
      ],
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
