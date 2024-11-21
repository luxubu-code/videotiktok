import 'package:flutter/material.dart';

Future<void> bottomBarSetting(BuildContext context) async {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) => Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      // Chiều cao cố định cho bottom sheet
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          // Thanh kéo ở đầu bottom sheet
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                _buildSettingItem(
                  icon: Icons.settings,
                  title: 'Settings and privacy',
                  onTap: () {
                    // Xử lý khi nhấn vào Settings
                    Navigator.pop(context);
                  },
                ),
                _buildSettingItem(
                  icon: Icons.help_outline,
                  title: 'Help Center',
                  onTap: () {
                    // Xử lý khi nhấn vào Help
                    Navigator.pop(context);
                  },
                ),
                _buildSettingItem(
                  icon: Icons.report_problem_outlined,
                  title: 'Report a problem',
                  onTap: () {
                    // Xử lý khi nhấn vào Report
                    Navigator.pop(context);
                  },
                ),
                _buildSettingItem(
                  icon: Icons.language,
                  title: 'Language',
                  onTap: () {
                    // Xử lý khi nhấn vào Language
                    Navigator.pop(context);
                  },
                ),
                _buildSettingItem(
                  icon: Icons.logout,
                  title: 'Log out',
                  onTap: () {
                    // Xử lý khi nhấn vào Logout
                    Navigator.pop(context);
                  },
                  isDestructive: true,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildSettingItem({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  bool isDestructive = false,
}) {
  return ListTile(
    leading: Icon(
      icon,
      color: isDestructive ? Colors.red : Colors.white,
    ),
    title: Text(
      title,
      style: TextStyle(
        color: isDestructive ? Colors.red : Colors.white,
        fontSize: 16,
      ),
    ),
    onTap: onTap,
  );
}
