import 'activity.dart';

class Task {
  Activity activity;
  bool isCompleted;

  Task({
    required this.activity,
    this.isCompleted = false,
  });
}
