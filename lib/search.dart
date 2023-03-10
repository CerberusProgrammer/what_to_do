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

  bool displayFilterType = false;
  double sliderValue = 1;
  String radioValue = 'Free';

  @override
  Widget build(BuildContext context) {
    typeStrings();
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ListTile(
                      title: const Center(child: Text('Filter by Type')),
                      onTap: () {
                        setState(() {
                          if (displayFilterType) {
                            displayFilterType = false;
                          } else {
                            displayFilterType = true;
                          }
                        });
                      },
                    ),
                    const Divider(),
                    displayFilterType
                        ? SizedBox(
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
                                            for (int i = 0;
                                                i < isPressed.length;
                                                i++) {
                                              if (i != index) {
                                                setState(() {
                                                  isPressed[i] = false;
                                                });
                                              }
                                            }
                                          }

                                          if (times[index] == 2) {
                                            for (int i = 0;
                                                i < isPressed.length;
                                                i++) {
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
                          )
                        : Center(),
                    const Divider(),
                    ListTile(
                      title:
                          const Center(child: Text('Filter by Participants')),
                      onTap: () {},
                    ),
                    const Divider(),
                    Slider(
                      onChanged: (double value) {
                        setState(() {
                          sliderValue = value;
                        });
                      },
                      onChangeEnd: (value) {},
                      value: sliderValue,
                      max: 5,
                      min: 1,
                      divisions: 5,
                      label: '${sliderValue.round()}',
                    ),
                    const Divider(),
                    ListTile(
                      title: const Center(child: Text('Filter by Price')),
                      onTap: () {},
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Free'),
                        Radio<String>(
                            value: 'Free',
                            groupValue: radioValue,
                            onChanged: (String? value) {}),
                        const Text('Paid'),
                        Radio<String>(
                            value: 'Free',
                            groupValue: radioValue,
                            onChanged: (String? value) {}),
                      ],
                    ),
                    const Divider(),
                    ListTile(
                      title:
                          const Center(child: Text('Filter by Accessibility')),
                      onTap: () {},
                    ),
                    const Divider(),
                    const Divider(),
                    FilledButton(onPressed: () {}, child: Text('Search')),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.search),
      ),
    );
  }
}
