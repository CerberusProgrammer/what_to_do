import 'package:flutter/material.dart';
import 'package:what_to_do/object/activity.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<StatefulWidget> createState() => _Search();
}

class _Search extends State<StatefulWidget> {
  List<Text> typeButtons = [];

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
                  Row(
                    children: [
                      FilledButton(onPressed: () {}, child: typeButtons[0]),
                      FilledButton(onPressed: () {}, child: typeButtons[1]),
                      FilledButton(onPressed: () {}, child: typeButtons[2]),
                      FilledButton(onPressed: () {}, child: typeButtons[3]),
                      FilledButton(onPressed: () {}, child: typeButtons[4]),
                      FilledButton(onPressed: () {}, child: typeButtons[5]),
                      FilledButton(onPressed: () {}, child: typeButtons[6]),
                      FilledButton(onPressed: () {}, child: typeButtons[7]),
                      FilledButton(onPressed: () {}, child: typeButtons[8]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
