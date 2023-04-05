import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../data/activities.dart';
import '../data/tasks.dart';

class FinishedTask extends StatefulWidget {
  const FinishedTask(this.index, {super.key});

  final int index;

  @override
  State<StatefulWidget> createState() => _FinishedTask(index);
}

class _FinishedTask extends State<FinishedTask> {
  int index;

  _FinishedTask(this.index);

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

        openDatabase(
          'wtd.db',
          onCreate: (db, version) {
            return db.execute(
              'CREATE TABLE activities(activity TEXT, type TEXT, participants INTEGER, price REAL, link TEXT, key TEXT PRIMARY KEY, accessibility REAL)',
            );
          },
          version: 1,
        ).then((database) {
          Activities.delete(database, tasks[index].activity);
          setState(() {
            Activities.setDataReady();
          });
        });

        setState(() {
          finishedTasks.add(tasks[index]);
          tasks.removeAt(index);
        });

        await Future.delayed(const Duration(seconds: 3));
        controller.reset();
      },
      child: const Text('Finish task'),
    );
  }
}
