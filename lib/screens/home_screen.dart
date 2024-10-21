import 'package:flutter/material.dart';
import '../widgets/app_bar.dart'; // Assuming you have a custom app bar
import '../widgets/video_card.dart'; // Assuming you have a custom video card

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(), // Use your custom app bar
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Replacing upper logo with the clear YouTube logo
            //Padding(
              //padding: const EdgeInsets.all(8.0),
              //child: Image.asset(
               // 'assets/images/youtube.png', // Path to the clear YouTube logo
               // width: 120, // Adjust size as needed
               // height: 50,
             // ),
           // ),
            
            // Categories section
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  // Explore Icon placed in front of "All"
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/explore.png', // New explore icon
                          width: 35, // Keep the same width
                          height: 35, // Keep the same height
                        ),
                        // Removed the Text widget to prevent overflow
                      ],
                    ),
                  ),
                  _buildCategoryChip("All", true), // All chip with black background
                  _buildCategoryChip("Music"),
                  _buildCategoryChip("Phaneroo"),
                  _buildCategoryChip("News"),
                  _buildCategoryChip("Movies"),
                  _buildCategoryChip("Mixes"),
                  _buildCategoryChip("Choirs"),
                ],
              ),
            ),
            const Divider(),

            // Video list and shorts section mixed together
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Videos",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,  // Ensures the ListView doesn't take full screen height
              physics: const NeverScrollableScrollPhysics(),  // Prevents nested scrolling issues
              itemCount: 12,  // 6 videos + 6 shorts (adjust the number as needed)
              itemBuilder: (context, index) {
                // Display videos before and after the shorts
                if (index == 3) {
                  // Insert shorts section after 3 videos
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Shorts",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,  // Ensures the grid doesn't take full screen height
                        physics: const NeverScrollableScrollPhysics(),  // Prevents nested scrolling issues
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,  // 3 columns for shorts grid
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 9 / 16,  // Vertical video aspect ratio
                        ),
                        itemCount: 6,  // Example short video count
                        itemBuilder: (context, shortIndex) {
                          return Container(
                            color: const Color.fromARGB(255, 214, 213, 213),
                            child: Center(
                              child: Text(
                                "Short ${shortIndex + 1}",
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          );
                        },
                      ),
                      const Divider(),
                    ],
                  );
                } else {
                  // Continue showing video cards
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),  // Adds vertical spacing between items
                    child: VideoCard(),  // Replace with your video card widget
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,  // Background color set to white for better contrast
        unselectedItemColor: Colors.black,  // Black color for unselected icons
        selectedItemColor: Colors.black,  // Black color for selected icons
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Upload',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: 'Subscriptions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'You',
          ),
        ],
      ),
    );
  }

  // Modified _buildCategoryChip to support different backgrounds
  Widget _buildCategoryChip(String label, [bool isAll = false]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: isAll ? Colors.white : Colors.black),
        ),
        backgroundColor: isAll ? Colors.black : const Color.fromARGB(255, 248, 245, 245),
      ),
    );
  }
}
