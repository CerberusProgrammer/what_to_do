import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

import '../object/user.dart';

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
                      onTap: () {},
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
                        title: Text('Clear data'),
                        subtitle: Text(
                            'Remove all the data from the tasks you already do.'),
                      ),
                    ),
                    const Divider(),
                    InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: () {},
                      child: const ListTile(
                        leading: SizedBox(
                          width: 40,
                          height: 40,
                          child: Card(
                            color: Colors.amber,
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward),
                        title: Text('Clear user data'),
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
