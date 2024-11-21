import 'package:flutter/material.dart';

class ProfileAppBar extends StatefulWidget {
  final VoidCallback settings;

  const ProfileAppBar({super.key, required this.settings});

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Spacer(),
        Text(
          'Name',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: widget.settings,
            icon: Icon(Icons.settings),
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
