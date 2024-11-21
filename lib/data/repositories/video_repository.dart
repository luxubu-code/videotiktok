import 'package:videotiktok/core/services/video_service.dart';
import 'package:videotiktok/data/models/video.dart';

class VideoRepository {
  final VideoService videoService;

  VideoRepository(this.videoService);

  Future<List<Video>> getVideos() async {
    return await videoService.fetchVideos();
  }
}
