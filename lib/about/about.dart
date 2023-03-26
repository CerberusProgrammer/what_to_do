import 'package:flutter/material.dart';

import '../object/user.dart';

class About extends StatefulWidget {
  User user;

  About({required this.user, super.key});

  @override
  State<About> createState() => _AboutState(user);
}

class _AboutState extends State<About> {
  User user;

  _AboutState(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (builder, constraints) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'About',
                      style: TextStyle(fontSize: 48),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withAlpha(200)
                          .withBlue(30),
                      elevation: 10,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 40,
                              child: user.image
                                  ? const Center()
                                  : const Icon(
                                      Icons.person,
                                    ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  user.name,
                                  style: const TextStyle(fontSize: 24),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FilledButton(
                                        onPressed: () {},
                                        child: Text(
                                            'Completed: ${user.completedTasks}')),
                                    FilledButton(
                                        onPressed: () {},
                                        child: Text(
                                            'Pending: ${user.pendingTasks}')),
                                    FilledButton(
                                        onPressed: () {},
                                        child:
                                            Text('Failed: ${user.failedTasks}'))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
