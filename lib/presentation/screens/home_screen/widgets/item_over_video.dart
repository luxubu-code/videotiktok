import 'package:flutter/material.dart';
import 'package:videotiktok/presentation/widgets/button_widget.dart';

class ItemOverVideo extends StatefulWidget {
  final bool isPlaying;
  final int like;

  const ItemOverVideo({super.key, required this.isPlaying, required this.like});

  @override
  State<ItemOverVideo> createState() => _ItemOverVideoState();
}

class _ItemOverVideoState extends State<ItemOverVideo> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: widget.isPlaying
              ? null
              : Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 150,
                ),
        ),
        Positioned(
          right: 10,
          bottom: 100,
          child: Column(
            children: [
              ButtonWidget().IconButton(
                  'User name', Icons.supervised_user_circle_sharp, () {}),
              SizedBox(
                height: 20,
              ),
              ButtonWidget()
                  .IconButton('${widget.like}', Icons.favorite, () {}),
              ButtonWidget().IconButton('comment', Icons.comment, () {}),
              ButtonWidget().IconButton('bookmark', Icons.bookmark_add, () {}),
              ButtonWidget().IconButton('share', Icons.share, () {}),
            ],
          ),
        ),
      ],
    );
  }
}
