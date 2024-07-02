import 'package:flutter/material.dart';

class ShowSnackbarMessenger {
  static void showSnackBarMessenger(BuildContext context, Widget widget) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: widget,
      ),
    );
  }
}
