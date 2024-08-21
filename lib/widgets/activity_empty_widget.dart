import 'package:fannelance_worker/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivityEmptyWidget extends StatelessWidget {
  final double? iconSize;
  final double? fontSize;
  const ActivityEmptyWidget({
    super.key,
    this.iconSize = 100,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/activity.svg',
            height: iconSize,
            colorFilter: const ColorFilter.mode(
              kGrey6,
              BlendMode.srcIn,
            ),
          ),
          Text(
            'No Activity Right Now!',
            style: TextStyle(
              fontSize: fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
