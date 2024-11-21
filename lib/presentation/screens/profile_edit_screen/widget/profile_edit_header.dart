import 'package:flutter/material.dart';

import '../../../../core/utils/navigation_utils.dart';

class ProfileEditHeader extends StatefulWidget {
  const ProfileEditHeader({super.key});

  @override
  State<ProfileEditHeader> createState() => _ProfileEditHeaderState();
}

class _ProfileEditHeaderState extends State<ProfileEditHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Text(
              'Edit Profile',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            left: 0,
            child: IconButton(
              onPressed: () => NavigationUtils().goBack(context),
              icon: const Icon(Icons.arrow_back_sharp),
            ),
          ),
        ],
      ),
    );
  }
}
