import 'dart:convert';

import 'package:dynamic_fair/page/dome_page.dart';
import 'package:dynamic_fair/page/dynamic_page.dart';
import 'package:flutter/material.dart';

import 'fair_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    DynamicPage(fairProps: {'auth': 'Internal Team', 'title': 'dynamic page show'}),
    DomePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '主页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree_sharp),
            label: 'demo',
          ),
        ],
      ),
    );
  }
}
