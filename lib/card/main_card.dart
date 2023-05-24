import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:metaballs/metaballs.dart';
import 'package:what_to_do/card/activity_card.dart';
import 'package:what_to_do/data/constants.dart';
import 'package:what_to_do/object/user.dart';
import '../object/activity.dart';
import '../object/fetch.dart';
import '../secret.dart';

class MainCard extends StatefulWidget {
  const MainCard({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _MainCard();
}

class _MainCard extends State<StatefulWidget> {
  Activity a = Activity.random();
  bool showActivity = false;
  InterstitialAd? _interstitialAd;

  void sync() async {
    Activity activity = await Fetch.getActivity();
    a = activity;
  }

  @override
  void initState() {
    super.initState();
    _createInterstitialAd();
  }

  void _createInterstitialAd() {
    if (Platform.isAndroid) {
      InterstitialAd.load(
        adUnitId: admob_id,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) => _interstitialAd = ad,
          onAdFailedToLoad: (error) =>
              print('Failed to load interstitial ad: $error'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
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
                            : Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 400,
                                    child: DefaultTextStyle(
                                      style: GoogleFonts.anton(
                                        fontSize: 56,
                                      ),
                                      child: AnimatedTextKit(
                                        pause:
                                            const Duration(milliseconds: 100),
                                        repeatForever: true,
                                        animatedTexts: List.generate(
                                            textPresentation.length, (index) {
                                          return RotateAnimatedText(
                                            textPresentation[index],
                                            duration:
                                                const Duration(seconds: 10),
                                            textAlign: TextAlign.center,
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
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
                                child: ActivityCard(
                                  false,
                                  activity: a,
                                  challenge: true,
                                  page: 2,
                                ),
                              )
                            : const Center(),
                        showActivity
                            ? FilledButton(
                                onPressed: () async {
                                  User.adtask += 1;
                                  if (User.adtask == 10) {
                                    User.adtask = 0;

                                    if (_interstitialAd == null) {
                                      return;
                                    }
                                    _interstitialAd!.fullScreenContentCallback =
                                        FullScreenContentCallback(
                                      onAdShowedFullScreenContent: (ad) => print(
                                          '$ad onAdShowedFullScreenContent.'),
                                      onAdDismissedFullScreenContent: (ad) {
                                        ad.dispose();
                                        _createInterstitialAd();
                                      },
                                      onAdFailedToShowFullScreenContent:
                                          (ad, error) {
                                        ad.dispose();
                                        _createInterstitialAd();
                                      },
                                    );
                                    _interstitialAd!.show();
                                  }

                                  setState(() {
                                    showActivity = true;
                                  });
                                },
                                child: const Text('Another'),
                              )
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
