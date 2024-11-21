import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videotiktok/core/constants/AppColors.dart';
import 'package:videotiktok/presentation/cubits/video_cubit.dart';
import 'package:videotiktok/presentation/cubits/video_state.dart';
import 'package:videotiktok/presentation/widgets/video_player_widget.dart';

class HomeScreen extends StatefulWidget {
  final initialIndex = 0;

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          TabBar(
            dividerColor: Colors.transparent,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                text: "For you",
              ),
              Tab(
                text: "Friend",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                BlocBuilder<VideoCubit, VideoState>(builder: (context, state) {
                  if (state is VideoLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is VideoSuccess) {
                    return PageView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.videos.length,
                      itemBuilder: (context, index) {
                        final videos = state.videos[index];
                        return VideoPlayerWidget(
                            title: videos.title,
                            descriptions: videos.descriptions,
                            videoUrl: videos.videoUrl,
                            views: videos.views,
                            likes: videos.likes,
                            userId: videos.userId);
                      },
                    );
                  } else if (state is VideoError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                }),
                Container(
                    decoration: BoxDecoration(color: AppColors.fuchsiaPurple),
                    child: Row(
                      children: [Text('data')],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
