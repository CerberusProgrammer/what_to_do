import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../object/user.dart';

class UserCard extends StatelessWidget {
  final ValueNotifier<double> valueNotifier;
  final BoxConstraints constraints;

  const UserCard({
    required this.constraints,
    required this.valueNotifier,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color:
          Theme.of(context).colorScheme.onPrimary.withAlpha(200).withBlue(30),
      elevation: 10,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 20,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: RandomAvatar(
                    User.mainUser.name,
                    height: 100,
                    width: 100,
                  ),
                ),
                SimpleCircularProgressBar(
                  progressColors: [
                    Theme.of(context).colorScheme.primary,
                  ],
                  fullProgressColor: Theme.of(context).colorScheme.primary,
                  size: 100,
                  maxValue: User.mainUser.accepted.toDouble(),
                  mergeMode: true,
                  animationDuration: 3,
                  valueNotifier: valueNotifier,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              User.mainUser.name,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
