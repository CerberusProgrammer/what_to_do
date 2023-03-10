import 'package:flutter/material.dart';
import 'object/activity.dart';
import 'object/fetch.dart';

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
                        ? Card(
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    a.activity,
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(a.type),
                                  Text('${a.participants}'),
                                  a.price > 0
                                      ? Text(
                                          'Price: ${a.price}',
                                          style: const TextStyle(fontSize: 24),
                                        )
                                      : const Text(
                                          'Price: Free!',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                  Text(
                                    'Accessibility: ${a.accessibility * 100}%',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  a.link.isNotEmpty
                                      ? Text(a.link,
                                          style: const TextStyle(fontSize: 24))
                                      : const Text(''),
                                ],
                              ),
                            ),
                          )
                        : const Text(''),
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
