import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:videotiktok/presentation/screens/home_screen/widgets/item_over_video.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String? title;
  final String? descriptions;
  final String videoUrl;
  final int views;
  final int likes;
  final String userId;

  const VideoPlayerWidget(
      {super.key,
      required this.title,
      required this.descriptions,
      required this.videoUrl,
      required this.views,
      required this.likes,
      required this.userId});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidget();
}

class _VideoPlayerWidget extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isInitState = false;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initStateVideo();
  }

  Future<void> _initStateVideo() async {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    try {
      await _controller.initialize();
      _controller.setLooping(true);
      _controller.play();
      setState(() {
        _isInitState = true;
      });
    } catch (e) {
      print('error from VideoPlayerWidget ${e}');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitState) {
      _isPlaying = true;
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_controller.value.isPlaying) {
            _controller.pause();
            _isPlaying = false;
          } else {
            _isPlaying = true;
            _controller.play();
          }
        });
      },
      child: Stack(
        children: [
          VideoPlayer(_controller),
          ItemOverVideo(
            isPlaying: _isPlaying,
            like: widget.likes,
          )
        ],
      ),
    );
  }
}
