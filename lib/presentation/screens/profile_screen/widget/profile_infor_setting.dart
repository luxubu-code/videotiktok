import 'package:flutter/material.dart';

class ProfileInforSetting extends StatefulWidget {
  final VoidCallback onEditProfile;
  final VoidCallback onShareProfile;
  final VoidCallback onAddAction;

  const ProfileInforSetting(
      {super.key,
      required this.onEditProfile,
      required this.onShareProfile,
      required this.onAddAction});

  @override
  State<ProfileInforSetting> createState() => _ProfileInforSettingState();
}

class _ProfileInforSettingState extends State<ProfileInforSetting> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey),
          child: TextButton(
            onPressed: widget.onEditProfile,
            child: Text('Edit Profile'),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey),
          child: TextButton(
            onPressed: widget.onShareProfile,
            child: Text('Share Profile'),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey),
          child: IconButton(
            onPressed: widget.onShareProfile,
            icon: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
