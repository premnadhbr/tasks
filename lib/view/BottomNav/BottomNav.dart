import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_19/view/categories/categories.dart';
import 'package:flutter_application_19/view/home/home.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _HomeState();
}

class _HomeState extends State<Bottomnav> {
  int _selectedIndex = 0;

  List<Widget> screens = [
    Home(),
    Categories(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 2,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow[500],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_max_outlined),
          ),
          BottomNavigationBarItem(
            label: "Categories",
            icon: Icon(Icons.category_outlined),
          ),
          BottomNavigationBarItem(
            label: "Offers",
            icon: Icon(Icons.celebration_outlined),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Icon(Icons.shopping_bag_outlined),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person_2_outlined),
          ),
        ],
      ),
    );
  }
}
