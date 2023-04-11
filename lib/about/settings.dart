import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:what_to_do/about/change_theme.dart';

import '../data/constants.dart';
import '../data/data.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Theme',
                  style: TextStyle(fontSize: 36),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (builder) {
                              return const ChangeTheme();
                            });
                      },
                      child: const ListTile(
                        leading: SizedBox(
                          width: 40,
                          height: 40,
                          child: Card(
                            color: Colors.blue,
                            child: Icon(
                              Icons.brush,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward),
                        title: Text('Change'),
                        subtitle: Text(
                            'Personalize your experience modifying the theme.'),
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (builder) {
                              return AlertDialog(
                                title: const Text('Reset Theme'),
                                content: const Text(
                                    'Are you sure you want to reset the theme?'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel')),
                                  FilledButton(
                                      onPressed: () {
                                        AdaptiveTheme.of(context).reset();
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Reset'))
                                ],
                              );
                            });
                      },
                      child: const ListTile(
                        leading: SizedBox(
                          width: 40,
                          height: 40,
                          child: Card(
                            color: Colors.deepPurple,
                            child: Icon(
                              Icons.refresh,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward),
                        title: Text('Reset'),
                        subtitle: Text('Set to the default theme.'),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Data',
                  style: TextStyle(fontSize: 36),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (builder) {
                              return AlertDialog(
                                title: const Text('Remove task data'),
                                content: const Text(
                                    'Are you sure you want to delete all tasks data?'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel')),
                                  FilledButton(
                                      onPressed: () {
                                        openDatabase(activityDatabase)
                                            .then((value) {
                                          Data.deleteAllActivities(value);
                                        });

                                        listActivity.clear();
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Delete'))
                                ],
                              );
                            });
                      },
                      child: const ListTile(
                        leading: SizedBox(
                          width: 40,
                          height: 40,
                          child: Card(
                            color: Colors.red,
                            child: Icon(
                              Icons.highlight_off,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward),
                        title: Text('Task data'),
                        subtitle: Text(
                            'Remove all the data from the tasks you already do.'),
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (builder) {
                              return AlertDialog(
                                title: const Text('Remove task data'),
                                content: const Text(
                                    'Are you sure you want to delete all tasks data?'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel')),
                                  FilledButton(
                                      onPressed: () {
                                        openDatabase(userDatabase)
                                            .then((value) {
                                          Data.deleteAllUser(value);
                                        });

                                        listUser.clear();
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Delete'))
                                ],
                              );
                            });
                      },
                      child: const ListTile(
                        leading: SizedBox(
                          width: 40,
                          height: 40,
                          child: Card(
                            color: Colors.orange,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward),
                        title: Text('User data'),
                        subtitle: Text('Remove your username and preferences.'),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
