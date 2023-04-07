import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:what_to_do/data/constants.dart';
import 'package:what_to_do/progress/progress.dart';

import '../data/data.dart';
import '../home.dart';
import '../object/activity.dart';
import '../object/user.dart';

class FinishedTask extends StatelessWidget {
  final int index;

  const FinishedTask(this.index, {super.key});

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

        Activity activity = listActivity[index];
        listActivity.removeAt(index);

        HomeState.nextPage(1);

        User.mainUser.completed += 1;
        User.mainUser.saveType(activity.type);

        openDatabase(
          'wtd.db',
          onCreate: (db, version) {
            return db.execute(
              'CREATE TABLE activities(id INTEGER PRIMARY KEY, activity TEXT, type TEXT, participants INTEGER, price REAL, link TEXT, key TEXT, accessibility REAL, isCompleted INTEGER)',
            );
          },
          version: 1,
        ).then((value) {
          Data.delete(
            value,
            activity,
            activityTable,
          );
        });

        await Future.delayed(const Duration(seconds: 1));
        Navigator.pop(Progress.buildContext);
      },
      child: const Text('Finish task'),
    );
  }
}
