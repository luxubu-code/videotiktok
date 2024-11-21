import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videotiktok/data/repositories/video_repository.dart';
import 'package:videotiktok/presentation/cubits/video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  final VideoRepository _videoRepository;

  VideoCubit(this._videoRepository) : super(VideoInitial());

  Future<void> fetchVideos() async {
    emit(VideoLoading());
    try {
      final videos = await _videoRepository.getVideos();
      emit(VideoSuccess(videos));
    } catch (e) {
      emit(VideoError('Failed to load videos : ${e}'));
    }
  }
}
