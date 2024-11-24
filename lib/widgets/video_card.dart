import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final String imagePath; // Path to the video thumbnail
  final String title; // Video title
  final String channelInfo; // Channel info, views, and date

  const VideoCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.channelInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.grey[800],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Video thumbnail
          Container(
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          // Video title
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          // Channel info, views, and date
          Text(
            channelInfo,
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          ),
        ],
      ),
    );
  }
}
