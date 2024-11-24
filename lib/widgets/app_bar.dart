import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.black,
    title: Row(
      children: [
        // YouTube logo at the extreme left with padding if needed
        Padding(
          padding: const EdgeInsets.only(left: 10.0), // Adjust if needed
          child: Image.asset(
            'assets/images/youtube.png', // Make sure to place your logo in the assets folder
            height: 120, // Adjusted the size for better fit
            width: 120,  // Adjusted the size for better fit
          ),
        ),
        const Spacer(), // This will push the following icons to the right side

        // Cast icon in white color
        IconButton(
          icon: const Icon(Icons.cast, color: Colors.white),
          onPressed: () {
            // Handle cast icon tap
          },
        ),

        // Notification icon with red badge showing 3 notifications
        Stack(
          clipBehavior: Clip.none, // To allow the badge to overflow
          children: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {
                // Handle notifications tap
              },
            ),
            Positioned(
              right: 4, // Moved closer to the icon
              top: 4,   // Moved closer to the icon
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: const Text(
                  '3',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),

        // Search icon after notification with white color
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {
            // Handle search tap
          },
        ),

        // Profile icon at the extreme right
        const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.person, color: Colors.black), // Changed icon color for better contrast
        ),
      ],
    ),
  );
}
