import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:what_to_do/object/activity.dart';

import '../object/user.dart';

class TypeCards extends StatelessWidget {
  final List<ValueNotifier<double>> listValuesNotifierTasks;
  final BoxConstraints constraints;

  const TypeCards(
      {super.key,
      required this.listValuesNotifierTasks,
      required this.constraints});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: constraints.maxWidth < 300
            ? 1
            : constraints.maxWidth < 500
                ? 3
                : constraints.maxWidth < 600
                    ? 4
                    : constraints.maxWidth < 700
                        ? 5
                        : 6,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 0.0,
        shrinkWrap: true,
        children: List.generate(listValuesNotifierTasks.length, (index) {
          return Card(
            color: Activity.typeColorsInteger[index],
            child: Stack(
              children: [
                Positioned.fill(
                  child: Icon(
                    Activity.typeIconsInteger[index],
                    color: const Color.fromARGB(41, 224, 224, 224),
                    size: 50.0,
                  ),
                ),
                Center(
                  child: SimpleCircularProgressBar(
                    progressColors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.onPrimary,
                    ],
                    fullProgressColor: Theme.of(context).colorScheme.primary,
                    size: 80,
                    maxValue: User.mainUser.accepted.toDouble(),
                    mergeMode: true,
                    valueNotifier: listValuesNotifierTasks[index],
                    onGetText: (double value) {
                      return Text(
                          '${((value.toInt() / User.mainUser.accepted) * 100).toInt()}%');
                    },
                  ),
                )
              ],
            ),
          );
        }));
  }
}