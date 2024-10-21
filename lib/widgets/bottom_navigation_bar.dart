import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.red,
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Shorts'),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline), label: 'Upload'),
        BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions), label: 'Subscriptions'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'You'),
      ],
    );
  }
}