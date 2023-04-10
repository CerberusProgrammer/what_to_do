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
          return InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (builder) {
                    return AlertDialog(
                      backgroundColor: Activity.typeColorsInteger[index],
                      title:
                          Text(Activity.typeNamesInteger[index] ?? 'unknown'),
                      content: Text(
                          'You have a ${((listValuesNotifierTasks[index].value / User.mainUser.accepted) * 100).toInt()}% completed task with the category ${Activity.typeNamesInteger[index]}.'),
                    );
                  });
            },
            child: Card(
              color: Activity.typeColorsInteger[index],
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Icon(
                      Activity.typeIconsInteger[index],
                      color: const Color.fromARGB(255, 224, 224, 224),
                      size: 45.0,
                    ),
                  ),
                  Center(
                    child: SimpleCircularProgressBar(
                      progressColors: [
                        Activity.typeColorsInteger[index]!.withOpacity(1),
                        Theme.of(context).colorScheme.onPrimary,
                      ],
                      fullProgressColor: Activity.typeColorsInteger[index],
                      size: 80,
                      maxValue: User.mainUser.accepted.toDouble(),
                      mergeMode: true,
                      valueNotifier: listValuesNotifierTasks[index],
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
