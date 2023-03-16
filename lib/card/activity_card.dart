import 'package:flutter/material.dart';

import '../object/activity.dart';

class ActivityCard {
  static Widget createCard(Activity activity) {
    return Card(
      elevation: 20,
      //color: Activity.typeColors[activity.type],
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(116, 255, 193, 7),
              Activity.typeColors[activity.type] as Color,
            ],
            tileMode: TileMode.repeated,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  '${activity.activity}!',
                  style: const TextStyle(
                    fontSize: 24,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1),
                        blurRadius: 5.0,
                        color: Color.fromARGB(139, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        'Type: ${activity.type[0].toUpperCase() + activity.type.substring(1)}'),
                    Text('Suggested participants: ${activity.participants}'),
                    activity.price > 0
                        ? Text(
                            'Possible price: \$${activity.price * 100}',
                          )
                        : const Text(
                            'Possible price: Free!',
                          ),
                    Text(
                      'Accessibility: ${activity.accessibility * 100}%',
                    ),
                    activity.link.isNotEmpty
                        ? Text(
                            activity.link,
                          )
                        : const Center(),
                  ],
                ),
              ),
              Center(
                child: FilledButton(
                    onPressed: () {},
                    child: const Text('Take this challenge!')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
