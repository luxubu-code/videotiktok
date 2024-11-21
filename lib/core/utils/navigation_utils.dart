import 'package:flutter/material.dart';

class NavigationUtils {
  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  void navigateTo(BuildContext context, Widget widget) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }
}
