import 'package:flutter/material.dart';
import 'package:what_to_do/card/main_card.dart';
import 'package:what_to_do/search/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _controller;

  static const List<Widget> _pages = [
    MainCard(),
    Search(),
  ];

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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TabBarView(
        controller: _controller,
        children: _pages,
      ),
      bottomNavigationBar: Material(
          child: TabBar(
        tabs: _tabs,
        controller: _controller,
      )),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _pages.length,
      vsync: this,
    );
  }
}
