import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Row(
      children: [
        Image.asset(
          'assets/images/youtube.png', // Make sure to place your logo in the assets folder
          height: 50,
          width: 120,
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: const Icon(Icons.person),
        ),
      ],
    ),
  );
}
