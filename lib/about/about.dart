import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

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
                      'Settings',
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
                      child: ListTile(
                        leading: const CircleAvatar(
                          radius: 40,
                          child: Icon(Icons.person),
                        ),
                        title: const Text(
                          'Your name',
                          style: TextStyle(),
                        ),
                        onTap: () {},
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
