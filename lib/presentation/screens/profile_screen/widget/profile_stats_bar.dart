import 'package:flutter/material.dart';

class ProfileStatsBar extends StatefulWidget {
  final int following;
  final int followers;
  final int likes;

  const ProfileStatsBar(
      {super.key,
      required this.following,
      required this.followers,
      required this.likes});

  @override
  State<ProfileStatsBar> createState() => _ProfileStatsBarState();
}

class _ProfileStatsBarState extends State<ProfileStatsBar> {
  Widget _buildStatItem(String text, String stat) {
    return Column(
      children: [
        Text(
          stat,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('Following', '${widget.following}'),
          VerticalDivider(
            width: 20,
            thickness: 0.5,
            indent: 5,
            endIndent: 5,
            color: Colors.grey,
          ),
          _buildStatItem('Followers', '${widget.followers}'),
          VerticalDivider(
            width: 20,
            thickness: 0.5,
            indent: 5,
            endIndent: 5,
            color: Colors.grey,
          ),
          _buildStatItem('Likes', '${widget.likes}'),
        ],
      ),
    );
  }
}
