import 'package:fannelance_worker/core/constants.dart';
import 'package:flutter/material.dart';

class HomeOnOffWidget extends StatelessWidget {
  const HomeOnOffWidget({
    super.key,
    required this.isOnline,
  });

  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    var isOnlineColor = isOnline ? kGreen : kRedEc;
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isOnlineColor,
          ),
        ),
        const SizedBox(width: 8),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          child: Text(
            isOnline ? 'Online' : 'Offline',
            key: ValueKey<bool>(isOnline), 
            style: TextStyle(
              color: isOnlineColor,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
