import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:what_to_do/progress/tasks.dart';

import '../object/activity.dart';
import '../object/task.dart';

import 'package:url_launcher/url_launcher.dart';

class ActivityCard extends StatefulWidget {
  final Activity activity;
  final bool challenge;

  const ActivityCard(
    this.activity,
    this.challenge, {
    required Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  // Define cualquier variable de estado necesaria aquí

  @override
  Widget build(BuildContext context) {
    // Utilice las variables de estado aquí para construir la interfaz de usuario
    return Container(
        // ...
        );
  }

  void _performAdditionalLogic() {
    // Realice la lógica adicional aquí
  }

  @override
  void initState() {
    super.initState();
    _performAdditionalLogic();
  }
}

class _ActivityCard extends State<StatefulWidget> {
  Activity activity;
  bool challenge;

  _ActivityCard(this.activity, this.challenge);

  @override
  Widget build(BuildContext context) {
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
                                  title: Text(
                                      'Possible Participants: ${activity.participants}'),
                                  content: const Text(
                                      'This is only a suggestion for the quantity of participants in this activity.'),
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
                                    'This is an estimate of the cost of the activity. The amounts are in US dollars',
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
                        FilledButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                      'Accessibility Level: ${(activity.accessibility * 100).round()}'),
                                  content: const Text(
                                    'This represents the accesibility of the transportation or the difficulty of the activity. \n\nLower is more accessible and higher is more is more difficult to do.',
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
                          child: activity.accessibility * 100 < 33
                              ? const Text('Easy')
                              : activity.accessibility * 100 < 66
                                  ? const Text('Intermediate')
                                  : const Text('Hard'),
                        ),
                        activity.link.isNotEmpty
                            ? FilledButton(
                                onPressed: () async {
                                  var url = activity.link;
                                  final uri = Uri.parse(url);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(uri);
                                  }
                                },
                                child: const Icon(Icons.language))
                            : const Center(),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: challenge
                    ? FilledButton(
                        onPressed: () {
                          tasks.add(Task(
                            activity: activity,
                          ));
                        },
                        child: const Text(
                          'Take this challenge!',
                          style: TextStyle(fontSize: 16),
                        ))
                    : const Center(),
              ),
              Center(
                child: SizedBox(
                  width: 300,
                  child: ActionSlider.standard(
                    rolling: false,
                    width: 300.0,
                    backgroundColor: const Color.fromARGB(255, 116, 88, 4),
                    reverseSlideAnimationCurve: Curves.easeInOut,
                    reverseSlideAnimationDuration:
                        const Duration(milliseconds: 500),
                    toggleColor: Colors.amber,
                    icon: const Icon(Icons.add),
                    action: (controller) async {
                      controller.loading(); //starts loading animation
                      await Future.delayed(const Duration(seconds: 3));
                      controller.success(); //starts success animation
                      await Future.delayed(const Duration(seconds: 1));
                      controller.reset(); //resets the slider
                    },
                    child: const Text('Take this challenge',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
