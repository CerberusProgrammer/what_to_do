import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';

import '../object/task.dart';
import '../progress/tasks.dart';

class FinishedTask extends StatefulWidget {
  FinishedTask(this.index, {super.key});

  int index;

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

        setState(() {
          Task task = tasks.removeAt(index);
          finishedTasks.add(task);
        });

        await Future.delayed(const Duration(seconds: 3));
        controller.reset();
      },
      child: const Text('Finish task'),
    );
  }
}
