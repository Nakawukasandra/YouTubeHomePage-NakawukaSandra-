import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.grey[800],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            color: Colors.grey[700], // Placeholder for video thumbnail
          ),
          const SizedBox(height: 5),
          const Text(
            "Video Title",
            style: TextStyle(color: Colors.white, fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Channel Name • 1.2M views • 2 days ago",
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          ),
        ],
      ),
    );
  }
}
