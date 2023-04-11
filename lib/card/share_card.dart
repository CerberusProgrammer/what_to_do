import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';
import 'package:what_to_do/card/activity_card.dart';

import '../object/activity.dart';

class ShareCard extends StatelessWidget {
  final bool share;
  final Activity activity;
  final bool challenge;
  final int page;
  final int index;
  static ScreenshotController screenshotController = ScreenshotController();

  const ShareCard(
    this.share, {
    super.key,
    required this.activity,
    required this.challenge,
    required this.page,
    required this.index,
  });

  Future<void> shareScreenshotInstagram(BuildContext context) async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = await screenshotController.captureAndSave(directory.path);

    if (imagePath != null) {
      SocialShare.shareInstagramStory(
        appId: 'com.example.what_to_do',
        imagePath: imagePath,
        backgroundTopColor:
            '#${Activity.typeColors[activity.type]?.withOpacity(0.4).value.toRadixString(16)}',
        backgroundBottomColor:
            '#${Theme.of(context).colorScheme.onPrimary.withOpacity(0.4).value.toRadixString(16)}',
      );
    }
  }

  Future<void> shareToTwitter() async {
    SocialShare.shareTwitter(
      "I completed the task: ${activity.activity}!",
      hashtags: [
        (activity.type),
        (activity.accessibility < 33
            ? 'free'
            : activity.accessibility < 66
                ? 'intermediate'
                : 'hard'),
        'whattodo'
      ],
      trailingText: activity.price > 0
          ? "The task cost: ${activity.price * 100}"
          : "The task was free!",
    );
  }

  Future<void> shareOptions() async {
    String price = activity.price > 0
        ? "The task cost: ${activity.price * 100}"
        : "The task was free!";

    SocialShare.shareOptions(
      "I completed the task: ${activity.activity}! \n\n$price\n\n#${activity.type} #whattodo",
    );
  }

  Future<void> shareToWhatsApp() async {
    String price = activity.price > 0
        ? "The task cost: ${activity.price * 100}"
        : "The task was free!";

    SocialShare.shareWhatsapp(
      "I completed the task: ${activity.activity}! \n\n$price\n\n#${activity.type} #whattodo",
    );
  }

  Future<void> shareToTelegram() async {
    String price = activity.price > 0
        ? "The task cost: ${activity.price * 100}"
        : "The task was free!";

    SocialShare.shareTelegram(
      "I completed the task: ${activity.activity}! \n\n$price\n\n#${activity.type} #whattodo",
    );
  }

  Widget bigIcon(Color color, Function() onTap, IconData icon, double size) {
    return SizedBox(
      width: 80,
      height: 80,
      child: Card(
        color: color,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: onTap,
          child: Center(
            child: FaIcon(
              icon,
              color: Colors.white,
              size: size,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Share your achievement to your friends!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Screenshot(
            controller: screenshotController,
            child: SizedBox(
              width: 350,
              height: 430,
              child: ActivityCard(
                true,
                activity: activity,
                challenge: challenge,
                page: page,
              ),
            ),
          ),
          const Divider(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                bigIcon(const Color.fromRGBO(249, 144, 74, 100), () async {
                  await shareScreenshotInstagram(context);
                }, FontAwesomeIcons.instagram, 50),
                bigIcon(const Color.fromRGBO(29, 161, 242, 100), () async {
                  await shareToTwitter();
                }, FontAwesomeIcons.twitter, 45),
                bigIcon(const Color.fromARGB(156, 2, 147, 41), () async {
                  await shareToWhatsApp();
                }, FontAwesomeIcons.whatsapp, 50),
                bigIcon(const Color.fromARGB(255, 0, 136, 204), () async {
                  await shareToTelegram();
                }, FontAwesomeIcons.telegram, 50),
                bigIcon(const Color.fromARGB(156, 122, 124, 125), () async {
                  await shareOptions();
                }, FontAwesomeIcons.shareFromSquare, 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
