import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../object/user.dart';

class UserCard extends StatelessWidget {
  final ValueNotifier<double> valueNotifier;
  const UserCard({
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: User.mainUser.name == "default"
                    ? const Center()
                    : Text(
                        User.mainUser.name,
                        style: const TextStyle(fontSize: 24),
                      ),
              ),
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
                        size: 80,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Completed: ${User.mainUser.completed}'),
                Text('Accepted: ${User.mainUser.accepted}'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
