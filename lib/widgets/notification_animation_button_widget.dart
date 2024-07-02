import 'package:fannelance_worker/widgets/notification_button_widget.dart';
import 'package:flutter/material.dart';

class NotificationAnimationButtonWidget extends StatelessWidget {
  const NotificationAnimationButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Duration>(
      duration: const Duration(seconds: 10),
      tween: Tween(
        begin: const Duration(seconds: 10),
        end: Duration.zero,
      ),
      onEnd: () => Navigator.pop(context),
      builder: (
        BuildContext context,
        Duration value,
        Widget? child,
      ) {
        final seconds = value.inSeconds % 60;
        return NotificationButtonWidget(
          seconds: seconds,
        );
      },
    );
  }
}
