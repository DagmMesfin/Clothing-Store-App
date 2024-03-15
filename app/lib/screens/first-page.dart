import '/screens/bottomBarScreens/Home.dart';
import '/screens/bottomBarScreens/product.dart';
import '/screens/bottomBarScreens/profile.dart';
import '/screens/bottomBarScreens/search.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  int page = 0;
  final pages = [
    HomeScreen(),
    searchScreen(),
    productScreen(),
    profileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[page],
      bottomNavigationBar: GNav(
        onTabChange: (value) {
          setState(() {
            page = value;
          });
        },
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        //tabBackgroundColor: Colors.grey,
        activeColor: Colors.purple,
        color: Colors.grey,
        tabBorderRadius: 14,
        gap: 8,
        tabs: [
          GButton(
            icon: Icons.home,
            iconSize: 30,
            text: 'home',
          ),
          GButton(
            icon: Icons.search,
            iconSize: 30,
            text: 'search',
          ),
          GButton(
            icon: Icons.shopping_bag,
            iconSize: 30,
            text: 'product',
          ),
          GButton(
            icon: Icons.person_2_outlined,
            iconSize: 30,
            text: 'profile',
          )
        ],
      ),
    );
  }
}
