import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:what_to_do/card/main_card.dart';
import 'package:what_to_do/progress/progress.dart';
import 'package:what_to_do/search/search.dart';
import 'package:what_to_do/style/themes.dart';

import 'about/about.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  static late TabController controller;

  static const List<Widget> pages = [
    MainCard(),
    Search(),
    Progress(),
    About(),
  ];

  static void nextPage(int tab) {
    final int newTab = controller.index + tab;
    if (newTab < 0 || newTab >= controller.length) return;
    controller.animateTo(newTab);
  }

  static const List<Widget> _tabs = [
    Tab(
      icon: Icon(Icons.home),
      text: 'Home',
    ),
    Tab(
      icon: Icon(Icons.search),
      text: 'Search',
    ),
    Tab(
      icon: Icon(Icons.add_task),
      text: 'Progress',
    ),
    Tab(
      icon: Icon(Icons.person),
      text: 'Profile',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TabBarView(
          controller: controller,
          children: pages,
        ),
        bottomNavigationBar: Material(
            child: TabBar(
          tabs: _tabs,
          controller: controller,
        )),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: pages.length,
      vsync: this,
    );
  }
}
