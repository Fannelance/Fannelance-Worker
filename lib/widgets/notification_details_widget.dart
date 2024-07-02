import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/widgets/notification_animation_button_widget.dart';
import 'package:fannelance_worker/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

class NotificationDetailsWidget extends StatelessWidget {
  const NotificationDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    var textStyle = TextStyle(
      fontSize: screenWidth / 24,
      fontFamily: kBold,
      color: kGrey3,
    );
    return NotificationWidget(
      details: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kafr Ashlim, Qewaisna',
              style: textStyle,
            ),
            Text(
              '5 kms away',
              style: textStyle,
            ),
            box_15,
            const NotificationAnimationButtonWidget(),
          ],
        ),
      ),
    );
  }
}
