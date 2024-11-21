import 'package:flutter/material.dart';

class ProfileEditAvatar extends StatefulWidget {
  const ProfileEditAvatar({super.key});

  @override
  State<ProfileEditAvatar> createState() => _ProfileEditAvatarState();
}

class _ProfileEditAvatarState extends State<ProfileEditAvatar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPhotoOptions(context),
      child: CircleAvatar(
        backgroundImage: const AssetImage('assets/avatar.png'),
        radius: 60,
      ),
    );
  }
}

void showPhotoOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildOption('Take photo', () {
              Navigator.pop(context);
            }),
            _buildDivider(),
            _buildOption('Select from Gallery', () {
              Navigator.pop(context);
            }),
            _buildDivider(),
            _buildOption('View photo', () {
              Navigator.pop(context);
            }),
            _buildDivider(),
            _buildOption('Cancel', () {
              Navigator.pop(context);
            }),
            SizedBox(height: 8),
          ],
        ),
      );
    },
  );
}

Widget _buildOption(String title, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: title == 'Cancel' ? Colors.grey : Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}

Widget _buildDivider() {
  return Container(
    height: 1,
    color: Colors.grey[800],
  );
}
