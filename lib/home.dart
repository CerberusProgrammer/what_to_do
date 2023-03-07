import 'package:flutter/material.dart';
import 'package:what_to_do/activity.dart';
import 'package:what_to_do/fetch.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  Activity a = Activity.random();

  bool showActivity = false;

  void sync() async {
    Activity activity = await Fetch.getActivity();
    a = activity;
  }

  @override
  Widget build(BuildContext context) {
    sync();
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
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
                                  Text(
                                    'Price: ${a.price}',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                    'Accessibility: ${a.accessibility * 100}%',
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Text(''),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
