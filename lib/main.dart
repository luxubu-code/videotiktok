import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:videotiktok/core/services/video_service.dart';
import 'package:videotiktok/data/repositories/video_repository.dart';
import 'package:videotiktok/presentation/cubits/video_cubit.dart';
import 'package:videotiktok/presentation/screens/home/home.dart';

import 'di/service_locator.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoService = VideoService();
    return MaterialApp(
      color: Colors.transparent,
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => VideoCubit(
              VideoRepository(videoService),
            )..fetchVideos(),
          ),
        ],
        child: Home(),
      ),
    );
  }
}
