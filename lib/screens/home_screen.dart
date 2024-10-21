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
            const Divider(color: Colors.grey), // Light divider for contrast

            // Video list and shorts section mixed together
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Videos",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            ListView.builder(
              shrinkWrap: true, // Ensures the ListView doesn't take full screen height
              physics: const NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
              itemCount: 12, // 6 videos + 6 shorts (adjust the number as needed)
              itemBuilder: (context, index) {
                if (index == 3) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Shorts",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true, // Ensures the grid doesn't take full screen height
                        physics: const NeverScrollableScrollPhysics(), // Prevents nested scrolling issues
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 3 columns for shorts grid
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 9 / 16, // Vertical video aspect ratio
                        ),
                        itemCount: 6, // Example short video count
                        itemBuilder: (context, shortIndex) {
                          return Container(
                            color: Colors.grey[900], // Dark grey for shorts background
                            child: Center(
                              child: Text(
                                "Short ${shortIndex + 1}",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                      const Divider(color: Colors.grey),
                    ],
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0), // Adds vertical spacing between items
                    child: VideoCard(), // Replace with your video card widget
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF212121), // Dark background
        unselectedItemColor: Colors.grey, // Grey for unselected icons and labels
        selectedItemColor: Colors.grey, // Grey for selected icon and label
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
        selectedLabelStyle: const TextStyle(color: Colors.grey), // Grey for selected text
        unselectedLabelStyle: const TextStyle(color: Colors.grey), // Grey for unselected text
      ),
    );
  }

  Widget _buildCategoryChip(String label, [bool isAll = false]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: isAll ? Colors.black : Colors.white), // White text on dark background
        ),
        backgroundColor: isAll ? Colors.white : Colors.grey[800], // Dark background for chips
      ),
    );
  }
}
