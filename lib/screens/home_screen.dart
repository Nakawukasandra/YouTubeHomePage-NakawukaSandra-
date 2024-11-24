import 'package:flutter/material.dart';
import '../widgets/app_bar.dart'; // Assuming you have a custom app bar
import '../widgets/video_card.dart'; // Updated VideoCard with dynamic fields

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
      backgroundColor: Colors.black,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category section
            Container(
              color: Colors.grey[900],
              child: SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/explore.png',
                            width: 35,
                            height: 35,
                          ),
                        ],
                      ),
                    ),
                    _buildCategoryChip("All", true),
                    _buildCategoryChip("Music"),
                    _buildCategoryChip("Phaneroo"),
                    _buildCategoryChip("News"),
                    _buildCategoryChip("Movies"),
                    _buildCategoryChip("Mixes"),
                    _buildCategoryChip("Choirs"),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.grey),
            // Videos section
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Videos",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  10, // Total items (6 videos + 1 Shorts section + 3 shorts)
              itemBuilder: (context, index) {
                // Insert the Shorts section after 3 videos
                if (index == 3) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/short_logo.png', // Logo instead of text
                              width: 80, // Adjust size as needed
                              height: 80, // Adjust size as needed
                              fit: BoxFit.contain, // Proportional scaling
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // 3 columns for shorts
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio:
                              9 / 16, // Vertical video aspect ratio
                        ),
                        itemCount: 6, // Total number of shorts
                        itemBuilder: (context, shortIndex) {
                          final List<String> shortImages = [
                            'assets/images/mickey.jpg',
                            'assets/images/movie.jpg',
                            'assets/images/sand.jpg',
                            'assets/images/hill.jpeg',
                            'assets/images/mad.jpg',
                            'assets/images/soft.jpg',
                          ];

                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[900], // Placeholder color
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.asset(
                                    shortImages[shortIndex],
                                    fit: BoxFit.cover, // Ensure the image fits the box
                                  ),
                                  // Icons positioned in a Column
                                  // ignore: prefer_const_constructors
                                  Positioned(
                                    top: 8.0,
                                    right: 8.0,
                                    // ignore: prefer_const_constructors
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        // Like icon
                                        // ignore: prefer_const_constructors
                                        Icon(
                                          Icons.thumb_up,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        const SizedBox(height: 10),
                                        // Unlike icon
                                        // ignore: prefer_const_constructors
                                        Icon(
                                          Icons.thumb_down,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        const SizedBox(height: 10),
                                        // Message icon
                                        // ignore: prefer_const_constructors
                                        Icon(
                                          Icons.chat_bubble_outline,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        const SizedBox(height: 10),
                                        // Share icon
                                        // ignore: prefer_const_constructors
                                        Icon(
                                          Icons.share,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        const SizedBox(height: 10),
                                        // Remix icon
                                        // ignore: prefer_const_constructors
                                        Icon(
                                          Icons.loop, // Remix icon
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                        const SizedBox(height: 10),
                                        // Person icon
                                        // ignore: prefer_const_constructors
                                        Icon(
                                          Icons.person_add,
                                          color: Colors.white,
                                          size: 30.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const Divider(color: Colors.grey),
                    ],
                  );
                }

                // Regular videos
                else {
                  // Choose the correct thumbnail and title based on index
                  String imagePath;
                  String title;
                  String channelInfo;

                  if (index == 0) {
                    imagePath = 'assets/images/gospel.jpg';
                    title =
                        'Way Maker, Jesus, You are Beautiful || Amazing Gospel Songs Playlist';
                    channelInfo =
                        'Gospel Channel • 21.7k views • 3 days ago . 500 Likes';
                  } else if (index == 2) {
                    imagePath = 'assets/images/news.jpg'; // Third thumbnail
                    title =
                        'Breaking News: World Events You Need to Know About!';
                    channelInfo =
                        'News Network • 1M views • 2 days ago • 2k Likes';
                  } else {
                    imagePath = 'assets/images/phaneroo.jpg';
                    title =
                        'Wisdom and Revelation In The Knowledge Of Christ | Phaneroo Sunday';
                    channelInfo =
                        'Phaneroo Channel • 500K views • 5 days ago . 1.09k Likes';
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: VideoCard(
                      imagePath: imagePath,
                      title: title,
                      channelInfo: channelInfo,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF212121),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.grey,
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

  Widget _buildCategoryChip(String label, [bool isAll = false]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: isAll ? Colors.black : Colors.white),
        ),
        backgroundColor: isAll ? Colors.white : Colors.grey[800],
      ),
    );
  }
}
