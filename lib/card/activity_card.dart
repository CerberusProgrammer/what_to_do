import 'package:flutter/material.dart';

import '../object/activity.dart';

class ActivityCard {
  static Widget createCard(Activity activity, BuildContext context) {
    return Card(
      elevation: 20,
      //color: Activity.typeColors[activity.type],
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(116, 255, 193, 7),
              Activity.typeColors[activity.type] ?? Colors.amber,
            ],
            tileMode: TileMode.repeated,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  '${activity.activity}!',
                  style: const TextStyle(
                    fontSize: 28,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1),
                        blurRadius: 5.0,
                        color: Color.fromARGB(139, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FilledButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(activity.type[0].toUpperCase() +
                                        activity.type.substring(1)),
                                    content: Text(Activity
                                            .typeDescriptions[activity.type] ??
                                        'Error'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Icon(Activity.typeIcons[activity.type])),
                        FilledButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Título del diálogo'),
                                  content: Text('Contenido del diálogo'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cerrar'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: activity.participants > 1
                              ? Row(
                                  children: [
                                    const Icon(Icons.people_alt),
                                    Text(' ${activity.participants}')
                                  ],
                                )
                              : const Icon(Icons.person),
                        ),
                        FilledButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: const Text(
                                    'This is only a suggested cost of the activity. The numbers are in dollars.',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: activity.price > 0
                              ? Row(
                                  children: [
                                    const Icon(Icons.attach_money),
                                    Text(
                                      ' ${(activity.price * 100).round()}',
                                    ),
                                  ],
                                )
                              : const Text('Free'),
                        ),
                        activity.accessibility * 100 < 33
                            ? FilledButton(
                                onPressed: () {},
                                child: const Text('Easy'),
                              )
                            : activity.accessibility * 100 < 66
                                ? FilledButton(
                                    onPressed: () {},
                                    child: const Text('Intermediate'),
                                  )
                                : FilledButton(
                                    onPressed: () {},
                                    child: const Text('Hard'),
                                  ),
                      ],
                    ),
                    activity.link.isNotEmpty
                        ? Text(
                            activity.link,
                          )
                        : const Center(),
                  ],
                ),
              ),
              Center(
                child: FilledButton(
                    onPressed: () {},
                    child: const Text(
                      'Take this challenge!',
                      style: TextStyle(fontSize: 16),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
