import 'package:flutter/material.dart';
import 'package:what_to_do/object/activity.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<StatefulWidget> createState() => _Search();
}

class _Search extends State<StatefulWidget> {
  List<Text> typeButtons = [];

  List<bool> isPressed = [true, true, true, true, true, true, true, true, true];
  List<int> times = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  void typeStrings() {
    for (String key in Activity.typeColors.keys) {
      typeButtons.add(Text(key));
    }
  }

  @override
  Widget build(BuildContext context) {
    typeStrings();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text('Filter by Type'),
                  const Divider(),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: isPressed.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FilledButton(
                          onPressed: isPressed[index]
                              ? () {
                                  times[index] = times[index] + 1;

                                  if (times[index] == 1) {
                                    for (int i = 0; i < isPressed.length; i++) {
                                      if (i != index) {
                                        setState(() {
                                          isPressed[i] = false;
                                        });
                                      }
                                    }
                                  }

                                  if (times[index] == 2) {
                                    for (int i = 0; i < isPressed.length; i++) {
                                      setState(() {
                                        isPressed[i] = true;
                                      });
                                    }
                                    times[index] = 0;
                                  }
                                }
                              : null,
                          child: typeButtons[index],
                        );
                      },
                    ),
                  ),
                  const Divider(),
                  const Text('Filter by Participants'),
                  const Divider(),
                  const Divider(),
                  const Text('Filter by Price'),
                  const Divider(),
                  const Divider(),
                  const Text('Filter by Accessibility'),
                  const Divider(),
                  const Divider(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
