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

  void sync() async {
    Activity activity = await Fetch.getActivity();
    a = activity;
  }

  @override
  Widget build(BuildContext context) {
    sync();
    return Scaffold(
      appBar: AppBar(title: const Text('What to do?')),
      body: Text(a.activity),
    );
  }
}
