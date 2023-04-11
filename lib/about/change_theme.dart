import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:metaballs/metaballs.dart';

import '../style/themes.dart';

class ChangeTheme extends StatefulWidget {
  const ChangeTheme({super.key});

  @override
  State<StatefulWidget> createState() => _ChangeTheme();
}

class _ChangeTheme extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 500,
        child: Metaballs(
          color: const Color.fromARGB(255, 66, 133, 244),
          effect: MetaballsEffect.ripple(
            growthFactor: 1,
          ),
          gradient: LinearGradient(colors: [
            const Color.fromARGB(255, 90, 60, 255),
            Theme.of(context).colorScheme.primary,
          ], begin: Alignment.bottomRight, end: Alignment.topLeft),
          metaballs: 15,
          animationDuration: const Duration(milliseconds: 200),
          speedMultiplier: 1,
          bounceStiffness: 3,
          minBallRadius: 15,
          maxBallRadius: 40,
          glowRadius: 0.7,
          glowIntensity: 0.6,
          child: Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: GridView.count(
                crossAxisCount: 4,
                children: List.generate(Themes.colors.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Themes.colors[index],
                        side: const BorderSide(
                            color: Color.fromARGB(70, 35, 35, 35), width: 8),
                      ),
                      onPressed: () {
                        AdaptiveTheme.of(context).setTheme(
                          light: Themes.changeTheme(index),
                        );
                      },
                      child: null,
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
