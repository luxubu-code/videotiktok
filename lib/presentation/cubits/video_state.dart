import 'package:videotiktok/data/models/video.dart';

abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoSuccess extends VideoState {
  final List<Video> videos;

  VideoSuccess(this.videos);
}

class VideoError extends VideoState {
  final String message;

  VideoError(this.message);
}
