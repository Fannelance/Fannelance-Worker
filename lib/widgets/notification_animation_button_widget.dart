import 'package:fannelance_worker/widgets/home_button_widget.dart';
import 'package:fannelance_worker/widgets/notification_button_widget.dart';
import 'package:flutter/material.dart';

class NotificationAnimationButtonWidget extends StatefulWidget {
  final dynamic userData;

  const NotificationAnimationButtonWidget({
    super.key,
    this.userData,
  });

  @override
  NotificationAnimationButtonWidgetState createState() =>
      NotificationAnimationButtonWidgetState();
}

class NotificationAnimationButtonWidgetState
    extends State<NotificationAnimationButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Duration>(
      duration: const Duration(seconds: 10),
      tween: Tween(
        begin: const Duration(seconds: 10),
        end: Duration.zero,
      ),
      onEnd: () {
        Navigator.pop(context);
        setState(() {
          ButtonHomeWidgetState.isAvailable = true;
        });
      },
      builder: (buildContext, value, _) {
        final seconds = value.inSeconds % 60;
        return NotificationButtonWidget(
          seconds: seconds,
          userData: widget.userData,
        );
      },
    );
  }
}
