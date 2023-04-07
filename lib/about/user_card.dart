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
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  User.mainUser.name,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RandomAvatar(
                  User.mainUser.name,
                  height: 100,
                  width: 100,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SimpleCircularProgressBar(
                        progressColors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.onPrimary,
                        ],
                        fullProgressColor:
                            Theme.of(context).colorScheme.primary,
                        size: 90,
                        maxValue: User.mainUser.accepted.toDouble(),
                        mergeMode: true,
                        valueNotifier: valueNotifier,
                        onGetText: (double value) {
                          return Text(
                              '${((value.toInt() / User.mainUser.accepted) * 100).toInt()}%');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
