import 'package:fannelance_worker/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActivityEmptyWidget extends StatelessWidget {
  final double? fontSize;
  const ActivityEmptyWidget({
    super.key,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          box_25,
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
