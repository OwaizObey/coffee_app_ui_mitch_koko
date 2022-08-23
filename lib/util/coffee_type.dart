import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  final String coffeeType;

  CoffeeType({
    required this.coffeeType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(
        coffeeType,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orange),
      ),
    );
  }
}
