import 'dart:io';

import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sqflite/sqflite.dart';
import 'package:what_to_do/card/share_card.dart';
import 'package:what_to_do/data/constants.dart';
import 'package:what_to_do/progress/progress.dart';

import '../data/data.dart';
import '../home.dart';
import '../object/activity.dart';
import '../object/user.dart';
import '../secret.dart';

class FinishedTask extends StatefulWidget {
  final int index;

  const FinishedTask(this.index, {super.key});

  @override
  State<FinishedTask> createState() => _FinishedTaskState();
}

class _FinishedTaskState extends State<FinishedTask> {
  InterstitialAd? _interstitialAd;

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
    return ActionSlider.standard(
      sliderBehavior: SliderBehavior.stretch,
      width: 250.0,
      backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(40),
      toggleColor: Theme.of(context).colorScheme.primary,
      action: (controller) async {
        controller.loading();
        await Future.delayed(const Duration(seconds: 1));
        controller.success();
        await Future.delayed(const Duration(seconds: 1));

        Activity activity = listActivity[widget.index];
        listActivity.removeAt(widget.index);

        HomeState.nextPage(1);

        User.mainUser.completed += 1;
        User.mainUser.saveType(activity.type);

        openDatabase('wtd.db').then((value) {
          Data.delete(
            value,
            activity,
            activityTable,
          );
        });

        openDatabase(userDatabase).then((database) {
          Data.updateUser(database, User.mainUser);
        });

        await Future.delayed(const Duration(milliseconds: 100));
        // ignore: use_build_context_synchronously
        Navigator.pop(Progress.buildContext);

        // ignore: use_build_context_synchronously
        showDialog(
            context: context,
            builder: (builder) {
              return ShareCard(
                false,
                activity: activity,
                challenge: false,
                index: widget.index,
                page: 0,
              );
            });

        if (_interstitialAd != null) {
          _interstitialAd!.fullScreenContentCallback =
              FullScreenContentCallback(
            onAdShowedFullScreenContent: (ad) =>
                print('$ad onAdShowedFullScreenContent.'),
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _createInterstitialAd();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _createInterstitialAd();
            },
          );
          _interstitialAd!.show();
        }
      },
      child: const Text('Finish task'),
    );
  }
}
