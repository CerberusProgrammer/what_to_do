import 'package:flutter/material.dart';

import 'activity.dart';

class ActivityCard {
  static Widget createCard(Activity activity) {
    return Card(
      elevation: 20,
      color: Activity.typeColors[activity.type],
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '${activity.activity}!',
                style: const TextStyle(fontSize: 24),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                FilledButton(
                    onPressed: () {},
                    child: const Text('Take this challenge!')),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
