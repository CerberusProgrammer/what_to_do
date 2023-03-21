import 'package:flutter/material.dart';
import 'package:what_to_do/card/activity_card.dart';
import '../object/activity.dart';
import '../object/fetch.dart';

class MainCard extends StatefulWidget {
  const MainCard({super.key});

  @override
  State<StatefulWidget> createState() => _MainCard();
}

class _MainCard extends State<StatefulWidget> {
  Activity a = Activity.random();
  bool showActivity = false;

  void sync() async {
    Activity activity = await Fetch.getActivity();
    a = activity;
  }

  @override
  Widget build(BuildContext context) {
    sync();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Card(
            elevation: 10,
            child: SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'What to do Today?',
                        style: TextStyle(fontSize: 56),
                      ),
                    ),
                    FilledButton(
                      onPressed: () {
                        setState(() {
                          showActivity = true;
                        });
                      },
                      child: const Text('Discover it!'),
                    ),
                    showActivity
                        ? ActivityCard.createCard(a, context, true)
                        : const Center(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
