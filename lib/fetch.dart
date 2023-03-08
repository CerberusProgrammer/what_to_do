import 'dart:convert';

import 'package:http/http.dart' as http;

import 'activity.dart';

class Fetch {
  static Future<Activity> getActivity() async {
    final httpPackageUrl = Uri.https('boredapi.com', '/api/activity');
    final httpPackageInfo = await http.read(httpPackageUrl);

    final pending = jsonDecode(httpPackageInfo) as Map<String, dynamic>;
    Activity activity = Activity.fromJSON(pending);
    return activity;
  }
}
