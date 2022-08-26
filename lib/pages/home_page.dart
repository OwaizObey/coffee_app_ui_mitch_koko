// ignore_for_file: prefer_const_literals_to_create_immutables
import '../util/coffee_tile.dart';
import '../util/coffee_type.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  // List of coffee Types
  final List coffeeType = [
    //[coffeeType , isSelected]
    ['Cappucino', true],
    ['Latte', false],
    ['Black', false],
    ['Expresso', false],
    ['Hot', false],
    ['Cold', false],
    ['Iced Coffee', false],
    ['Caffe mocha', false],
  ];
  // User tapped on Coffee type
  void coffeeTypeSelected(int index) {  
    setState(() {
      // This for loop  makes every selection false
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      const Icon(
        Icons.home,
        size: 30,
        color: Colors.black,
      ),
      const Icon(
        Icons.favorite,
        size: 30,
        color: Colors.black,
      ),
      const Icon(
        Icons.notifications,
        size: 30,
        color: Colors.black,
      ),
      const Icon(
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
        leading: const Icon(Icons.menu),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
        height: 50,
        color: Colors.grey.shade400,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue(fontSize: 56),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee...',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //  Horizontal listview of coffee types
          Container(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: (() {
                    coffeeTypeSelected(index);
                  }),
                );
              },
            ),
          ),

          // horizontal listview of coffee tiles
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'lib/images/cappucino.jpg',
                  coffeeName: 'Cappucino',
                  coffeePrice: '4.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/latte.jpg',
                  coffeeName: 'Latte',
                  coffeePrice: '6.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/milk.jpg',
                  coffeeName: 'Milk',
                  coffeePrice: '8.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/Expresso.gif',
                  coffeeName: 'Expresso',
                  coffeePrice: '4.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/Expresso.jpg',
                  coffeeName: 'Caffe Mocha',
                  coffeePrice: '4.20',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
