import 'package:flutter/material.dart';
import 'package:videotiktok/core/utils/navigation_utils.dart';
import 'package:videotiktok/presentation/screens/profile_edit_screen/profile_edit_screen.dart';
import 'package:videotiktok/presentation/screens/profile_screen/widget/bottom_bar_setting.dart';
import 'package:videotiktok/presentation/screens/profile_screen/widget/profile_app_bar.dart';
import 'package:videotiktok/presentation/screens/profile_screen/widget/profile_infor_setting.dart';
import 'package:videotiktok/presentation/screens/profile_screen/widget/profile_stats_bar.dart';
import 'package:videotiktok/presentation/screens/profile_screen/widget/video_grid_icon.dart';

class ProfileScreen extends StatefulWidget {
  final initialIndex = 3;
  final String bio;

  const ProfileScreen({super.key, required this.bio});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late int _selectedIconIndex;

  void _handleIconSelected(int index) {
    _selectedIconIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        children: [
          ProfileAppBar(
            settings: () => bottomBarSetting(context),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    maxRadius: 100,
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ProfileStatsBar(following: 100, followers: 100, likes: 100),
                  SizedBox(
                    height: 20,
                  ),
                  ProfileInforSetting(
                    onEditProfile: () => NavigationUtils()
                        .navigateTo(context, ProfileEditScreen()),
                    onAddAction: () {},
                    onShareProfile: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: widget.bio != null
                        ? TextButton(
                            onPressed: () {},
                            child: Text('+Add bio'),
                          )
                        : Text(widget.bio),
                  ),
                  VideoGridIcon(
                    onIconSelected: (int) => _handleIconSelected,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
