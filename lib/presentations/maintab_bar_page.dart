import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/presentations/screens/home/home_page.dart';

class MainTabBarPage extends StatefulWidget {
  const MainTabBarPage({super.key});

  @override
  State<MainTabBarPage> createState() => __MainTabBarPageState();
}

class __MainTabBarPageState extends State<MainTabBarPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _getSelectedPage(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Courses',
          ),
        
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Courses',
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
       
      
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _getSelectedPage(int index) {
    switch (index) {
      case 0:
        return  HomePage();
      case 1:
        return const Text('Cart Page');
      case 2:
        return const Text('My Courses Page');
      case 3:
        return const Text('Courses Page');
      case 4:
        return const Text('Profile Page');
      default:
        return HomePage();
    }
  }
}