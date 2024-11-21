import 'package:flutter/material.dart';

class VideoGridIcon extends StatefulWidget {
  final Function(int) onIconSelected;

  const VideoGridIcon({super.key, required this.onIconSelected});

  @override
  State<VideoGridIcon> createState() => _VideoGridIconState();
}

class _VideoGridIconState extends State<VideoGridIcon> {
  late int _selectIndex;
  static const List<IconData> icons = [
    Icons.menu,
    Icons.lock_outline,
    Icons.replay,
    Icons.handshake_outlined,
    Icons.favorite_border,
  ];

  @override
  void initState() {
    super.initState();
    _selectIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onTapSelect(int selectIndex) {
    setState(() {
      _selectIndex = selectIndex;
    });
    widget.onIconSelected(selectIndex); // Gọi hàm callback
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        icons.length,
        (index) => IconButton(
          onPressed: () => _onTapSelect(index),
          icon: Icon(icons[index]),
          color: _selectIndex == index ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}
