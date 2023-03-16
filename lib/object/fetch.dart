import 'dart:convert';

import 'package:http/http.dart' as http;

import 'activity.dart';

class Fetch {
  static Future<Activity> getActivity() async {
    var url = 'https://www.boredapi.com/api/activity';
    var response = await http.get(Uri.parse(url));
    final pending = jsonDecode(response.body) as Map<String, dynamic>;
    Activity activity = Activity.fromJSON(pending);
    return activity;
  }

  static Future<Activity> searchByType(String type) async {
    var url = 'https://www.boredapi.com/api/activity?type=$type';
    var response = await http.get(Uri.parse(url));
    final pending = await jsonDecode(response.body) as Map<String, dynamic>;
    Activity activity = Activity.fromJSON(pending);
    return activity;
  }

  static Future<Activity> searchByParticipants(int participants) async {
    var url =
        'https://www.boredapi.com/api/activity?participants=$participants';
    var response = await http.get(Uri.parse(url));
    final pending = await jsonDecode(response.body) as Map<String, dynamic>;
    Activity activity = Activity.fromJSON(pending);
    return activity;
  }

  static Future<Activity> searchByPrice(bool paid) async {
    String url;

    if (paid) {
      url = 'https://www.boredapi.com/api/activity?minprice=0.1&maxprice=1';
    } else {
      url = 'https://www.boredapi.com/api/activity?activity?price=0.0';
    }

    var response = await http.get(Uri.parse(url));
    final pending = await jsonDecode(response.body) as Map<String, dynamic>;
    Activity activity = Activity.fromJSON(pending);
    return activity;
  }

  static Future<Activity> searchByAccessibility(double accessibility) async {
    var url =
        'https://www.boredapi.com/api/activity?accessibility=$accessibility';

    var response = await http.get(Uri.parse(url));
    final pending = await jsonDecode(response.body) as Map<String, dynamic>;
    Activity activity = Activity.fromJSON(pending);
    return activity;
  }
}
