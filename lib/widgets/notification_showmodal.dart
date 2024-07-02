import 'package:fannelance_worker/core/constants.dart';
import 'package:flutter/material.dart';

class NotificationShowModal {
  static void showModalSheet(
    BuildContext context,
    Widget widget,
  ) {
    showModalBottomSheet(
      isDismissible:false,
      backgroundColor: kWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.zero,
        ),
      ),
      context: context,
      builder: (context) {
        return widget;
      },
    );
  }
}
