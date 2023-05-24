import 'package:flutter/material.dart';
import 'package:what_to_do/card/activity_card.dart';
import 'package:what_to_do/object/activity.dart';

import '../object/fetch.dart';

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
  bool displayFilterParticipants = false;
  bool displayFilterPrice = false;
  bool displayFilterAccessibility = false;
  bool displayCard = false;
  bool enableSearch = false;
  double sliderParticipants = 1;
  double sliderAccessibility = 0;
  String? radioValue = '';

  Activity activity = Activity.random();
  Activity wait = Activity.random();

  void syncType(String filter) async {
    Activity a = await Fetch.searchByType(filter);
    activity = a;
  }

  void syncParticipants(int participants) async {
    Activity a = await Fetch.searchByParticipants(participants);
    activity = a;
  }

  void syncPrice(bool paid) async {
    Activity a = await Fetch.searchByPrice(paid);
    activity = a;
  }

  void syncAccessibility(double accessibility) async {
    Activity a = await Fetch.searchByAccessibility(accessibility);
    activity = a;
  }

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
                    displayCard
                        ? Expanded(
                            child: ActivityCard(
                              false,
                              activity: wait,
                              challenge: true,
                              page: 1,
                            ),
                          )
                        : const Center(),
                    ListTile(
                      visualDensity: const VisualDensity(vertical: -4),
                      title: const Center(child: Text('Filter by Type')),
                      onTap: () {
                        setState(() {
                          if (displayFilterType) {
                            displayFilterType = false;
                            enableSearch = false;
                          } else {
                            displayFilterType = true;
                            displayFilterPrice = false;
                            displayFilterAccessibility = false;
                            displayFilterParticipants = false;
                            enableSearch = false;
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
                                return Padding(
                                  padding: const EdgeInsets.only(right: 2),
                                  child: FilledButton(
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
                                                    enableSearch = true;
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
                                                  enableSearch = false;
                                                });
                                              }
                                              times[index] = 0;
                                            }
                                            syncType(typeButtons[index].data
                                                as String);
                                          }
                                        : null,
                                    child: typeButtons[index],
                                  ),
                                );
                              },
                            ),
                          )
                        : const Center(),
                    displayFilterType ? const Divider() : const Center(),
                    ListTile(
                      visualDensity: const VisualDensity(vertical: -4),
                      title:
                          const Center(child: Text('Filter by Participants')),
                      onTap: () {
                        setState(() {
                          if (displayFilterParticipants) {
                            displayFilterParticipants = false;
                            enableSearch = false;
                          } else {
                            displayFilterParticipants = true;
                            displayFilterAccessibility = false;
                            displayFilterType = false;
                            displayFilterPrice = false;
                            enableSearch = false;
                          }
                        });
                      },
                    ),
                    displayFilterParticipants
                        ? const Divider()
                        : const Center(),
                    displayFilterParticipants
                        ? Slider(
                            onChanged: (double value) {
                              setState(() {
                                sliderParticipants = value;
                                enableSearch = false;
                              });
                            },
                            onChangeEnd: (value) {
                              syncParticipants(value.round());
                              setState(() {
                                enableSearch = true;
                              });
                            },
                            value: sliderParticipants,
                            max: 5,
                            min: 1,
                            divisions: 4,
                            label: '${sliderParticipants.round()}',
                          )
                        : const Center(),
                    const Divider(),
                    ListTile(
                      visualDensity: const VisualDensity(vertical: -4),
                      title: const Center(child: Text('Filter by Price')),
                      onTap: () {
                        setState(() {
                          if (displayFilterPrice) {
                            displayFilterPrice = false;
                            enableSearch = false;
                          } else {
                            displayFilterPrice = true;
                            displayFilterAccessibility = false;
                            displayFilterParticipants = false;
                            displayFilterType = false;
                            enableSearch = false;
                          }
                        });
                      },
                    ),
                    const Divider(),
                    displayFilterPrice
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Free'),
                              Radio<String>(
                                  value: 'Free',
                                  groupValue: radioValue,
                                  onChanged: (String? value) {
                                    syncPrice(false);
                                    setState(() {
                                      radioValue = value;
                                      enableSearch = true;
                                    });
                                  }),
                              const Text('Paid'),
                              Radio<String>(
                                  value: 'Paid',
                                  groupValue: radioValue,
                                  onChanged: (String? value) {
                                    syncPrice(true);
                                    setState(() {
                                      radioValue = value;
                                      enableSearch = true;
                                    });
                                  }),
                            ],
                          )
                        : const Center(),
                    displayFilterPrice ? const Divider() : const Center(),
                    ListTile(
                      visualDensity: const VisualDensity(vertical: -4),
                      title:
                          const Center(child: Text('Filter by Accessibility')),
                      onTap: () {
                        setState(() {
                          if (displayFilterAccessibility) {
                            displayFilterAccessibility = false;
                            enableSearch = false;
                          } else {
                            displayFilterAccessibility = true;
                            displayFilterParticipants = false;
                            displayFilterPrice = false;
                            displayFilterType = false;
                            enableSearch = false;
                          }
                        });
                      },
                    ),
                    displayFilterAccessibility
                        ? Slider(
                            onChanged: (double value) {
                              setState(() {
                                sliderAccessibility = value;
                                enableSearch = false;
                              });
                            },
                            onChangeEnd: (value) {
                              syncAccessibility(value / 100);
                              setState(() {
                                enableSearch = true;
                              });
                            },
                            value: sliderAccessibility,
                            max: 100,
                            min: 0,
                            divisions: 10,
                            label: '${sliderAccessibility.round()}',
                          )
                        : const Center(),
                    SizedBox(
                        width: constraints.maxWidth,
                        height: 35,
                        child: FilledButton(
                          onPressed: enableSearch
                              ? () {
                                  wait = activity;
                                  setState(() {
                                    displayCard = true;
                                    displayFilterAccessibility = true;
                                    displayFilterParticipants = false;
                                    displayFilterPrice = false;
                                    displayFilterType = false;
                                    enableSearch = false;
                                    displayFilterAccessibility = false;
                                    enableSearch = false;
                                  });
                                }
                              : null,
                          child: const Text('Search'),
                        ))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
