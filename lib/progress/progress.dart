import 'package:flutter/material.dart';
import 'package:what_to_do/card/activity_card.dart';
import 'package:what_to_do/progress/tasks.dart';

import '../object/activity.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<StatefulWidget> createState() => _Progress();
}

class _Progress extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              elevation: 10,
              child: SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                colors: [
                                  const Color.fromARGB(116, 255, 193, 7),
                                  Activity.typeColors[
                                          tasks[index].activity.type] ??
                                      Colors.amber,
                                ],
                              ),
                            ),
                            child: ListTile(
                                trailing: Icon(Activity
                                    .typeIcons[tasks[index].activity.type]),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        elevation: 0,
                                        content: SizedBox(
                                          height: constraints.maxHeight / 3,
                                          child: ActivityCard.createCard(
                                              tasks[index].activity,
                                              context,
                                              false),
                                        ),
                                      );
                                    },
                                  );
                                },
                                onLongPress: () {
                                  setState(() {
                                    tasks.remove(tasks[index]);
                                  });
                                },
                                title: Text(tasks[index].activity.activity)),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
