import 'package:flutter/material.dart';
import 'package:metaballs/metaballs.dart';
import 'package:what_to_do/card/activity_card.dart';
import '../object/activity.dart';
import '../object/fetch.dart';

class MainCard extends StatefulWidget {
  const MainCard({super.key});

  @override
  State<StatefulWidget> createState() => _MainCard();
}

class _MainCard extends State<StatefulWidget> {
  Activity a = Activity.random();
  bool showActivity = false;

  void sync() async {
    Activity activity = await Fetch.getActivity();
    a = activity;
  }

  @override
  Widget build(BuildContext context) {
    sync();
    return LayoutBuilder(
      builder: (builder, constraints) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
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
                    width: constraints.maxWidth > 600
                        ? constraints.maxWidth / 2
                        : 300,
                    height: constraints.maxHeight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        showActivity
                            ? const Center()
                            : const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'What to do Today?',
                                  style: TextStyle(fontSize: 56),
                                ),
                              ),
                        showActivity
                            ? const Center()
                            : FilledButton(
                                onPressed: () {
                                  setState(() {
                                    showActivity = true;
                                  });
                                },
                                child: const Text('Discover it!'),
                              ),
                        showActivity
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ActivityCard.createCard(
                                    activity: a,
                                    challenge: true,
                                    context: context,
                                    page: 2),
                              )
                            : const Center(),
                        showActivity
                            ? FilledButton(
                                onPressed: () {
                                  setState(() {
                                    showActivity = true;
                                  });
                                },
                                child: const Text('Another'))
                            : const Center(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
