import 'package:flutter/material.dart';
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
    return Scaffold(body: LayoutBuilder(
      builder: (builder, constraints) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            child: Expanded(
              child: ListView(
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      child: UserCard(
                        valueNotifier: valueNotifierTasks,
                      )),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: TypeCards(
                            listValuesNotifierTasks: listValuesNotifierTasks,
                            constraints: constraints,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
