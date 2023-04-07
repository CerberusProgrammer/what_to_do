import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:what_to_do/object/activity.dart';

import '../object/user.dart';

class TypeCards extends StatelessWidget {
  final List<ValueNotifier<double>> listValuesNotifierTasks;

  const TypeCards({super.key, required this.listValuesNotifierTasks});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        shrinkWrap: true,
        children: List.generate(listValuesNotifierTasks.length, (index) {
          return Card(
            color: Activity.typeColorsInteger[index],
            child: Center(
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
            ),
          );
        }));
  }
}
