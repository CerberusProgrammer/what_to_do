import 'package:flutter/material.dart';
import 'package:what_to_do/card/activity_card.dart';

import '../data/data.dart';
import '../object/activity.dart';

class Progress extends StatefulWidget {
  const Progress({super.key});

  @override
  State<StatefulWidget> createState() => _Progress();
}

class _Progress extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    List<Activity> listActivityProgress = Data.listActivity;

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
                    child: listActivityProgress.isEmpty
                        ? const Center(
                            child: Text(
                              "No tasks, no progress. Add a task today!",
                              style: TextStyle(fontSize: 28),
                            ),
                          )
                        : ListView.builder(
                            itemCount: listActivityProgress.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [
                                        Theme.of(context).colorScheme.primary,
                                        Activity.typeColors[
                                                listActivityProgress[index]
                                                    .type] ??
                                            Colors.amber,
                                      ],
                                    ),
                                  ),
                                  child: ListTile(
                                      trailing: Icon(Activity.typeIcons[
                                          listActivityProgress[index].type]),
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              elevation: 0,
                                              child: SizedBox(
                                                width: constraints.maxWidth,
                                                height:
                                                    constraints.maxHeight / 1.5,
                                                child: ActivityCard(
                                                  activity:
                                                      listActivityProgress[
                                                          index],
                                                  challenge: false,
                                                  page: 0,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      onLongPress: () {},
                                      title: Text(listActivityProgress[index]
                                          .activity)),
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
