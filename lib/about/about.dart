import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:what_to_do/about/type_cards.dart';
import 'package:what_to_do/about/user_card.dart';

import '../object/user.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  late ValueNotifier<double> valueNotifierTasks;
  List<ValueNotifier<double>> listValuesNotifierTasks = [];

  @override
  void initState() {
    super.initState();
    valueNotifierTasks = ValueNotifier(User.mainUser.completed.toDouble());
    listValuesNotifierTasks
        .add(ValueNotifier(User.mainUser.education.toDouble()));
    listValuesNotifierTasks
        .add(ValueNotifier(User.mainUser.recreational.toDouble()));
    listValuesNotifierTasks.add(ValueNotifier(User.mainUser.social.toDouble()));
    listValuesNotifierTasks.add(ValueNotifier(User.mainUser.diy.toDouble()));
    listValuesNotifierTasks
        .add(ValueNotifier(User.mainUser.charity.toDouble()));
    listValuesNotifierTasks
        .add(ValueNotifier(User.mainUser.cooking.toDouble()));
    listValuesNotifierTasks
        .add(ValueNotifier(User.mainUser.relaxation.toDouble()));
    listValuesNotifierTasks.add(ValueNotifier(User.mainUser.music.toDouble()));
    listValuesNotifierTasks
        .add(ValueNotifier(User.mainUser.busywork.toDouble()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (builder, constraints) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, bottom: 8, top: 40),
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.settings)),
                                )
                              ],
                            ),
                            const Center(
                              child: Padding(padding: EdgeInsets.all(35)),
                            ),
                            Flexible(
                              child: ListView(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, bottom: 10),
                                    child: TypeCards(
                                      listValuesNotifierTasks:
                                          listValuesNotifierTasks,
                                      constraints: constraints,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Text(
                      User.mainUser.name,
                      style: const TextStyle(fontSize: 48),
                    )),
                Stack(
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
                      valueNotifier: valueNotifierTasks,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
