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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(color: kBlack, width: 2),
          borderRadius: BorderRadius.circular(50),
          color: kBlack),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isOnline ? Colors.green : Colors.red,
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
                color: isOnline ? Colors.green : Colors.red,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
