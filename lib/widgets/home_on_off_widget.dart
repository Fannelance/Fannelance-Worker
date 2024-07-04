import 'package:fannelance_worker/widgets/account_profile_widget.dart';
import 'package:flutter/material.dart';

class OnOffHomeWidget extends StatelessWidget {
  const OnOffHomeWidget({
    super.key,
    required this.isOnline,
  });

  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AccountProfileWidget(),
        const SizedBox(width: 90),
        // Animated status indicator
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isOnline ? Colors.green : Colors.red,
          ),
        ),
        const SizedBox(width: 8),
        // Animated switcher for status text
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder:
              (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: Text(
            isOnline ? 'Online' : 'Offline',
            key: ValueKey<bool>(
                isOnline), // Ensure the text changes smoothly
            style: TextStyle(
              color: isOnline ? Colors.green : Colors.red,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
