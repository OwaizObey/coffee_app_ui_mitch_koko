// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final items = [
      Icon(
        Icons.home,
        size: 30,
        color: Colors.black,
      ),
      Icon(
        Icons.favorite,
        size: 30,
        color: Colors.black,
      ),
      Icon(
        Icons.notifications,
        size: 30,
        color: Colors.black,
      ),
      Icon(
        Icons.search,
        size: 30,
        color: Colors.black,
      ),
    ];
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) => setState(
          (() => this.index = index),
        ),
      ),
      body: Column(
        children: [
          // Find thr best coffee for you

          // Search bar

          // horizontal listview of coffee tiles
        ],
      ),
    );
  }
}
