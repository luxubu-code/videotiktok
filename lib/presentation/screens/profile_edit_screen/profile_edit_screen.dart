import 'package:flutter/material.dart';
import 'package:videotiktok/presentation/screens/profile_edit_screen/widget/profile_edit_avatar.dart';
import 'package:videotiktok/presentation/screens/profile_edit_screen/widget/profile_edit_header.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileEditHeader(),
          ProfileEditAvatar(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'About you',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _rowText('Name', 'Linh Nguyên'),
                _rowText('Username', 'linh.nguyn6394'),
                _rowText('Bio', 'Add a bio'),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Social',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _rowText('Instagram', 'Add Instagram'),
                _rowText('Facebook', 'Add Facebook'),
                _rowText('Twitter', 'Add Twitter'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _rowText(String attribute, String text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            attribute,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.navigate_next_outlined, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
