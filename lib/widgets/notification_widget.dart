import 'package:fannelance_worker/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationWidget extends StatelessWidget {
  final Widget? trailing;
  final Widget? details;
  final Widget? inProgress;
  final dynamic userData;
  const NotificationWidget({
    super.key,
    this.trailing,
    this.details,
    this.inProgress,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    String userName = toBeginningOfSentenceCase('${userData!['firstname']} ') +
        toBeginningOfSentenceCase('${userData!['lastname']}');

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        box_5,
        ListTile(
          leading: const CircleAvatar(
            radius: 28,
            backgroundColor: kBlack,
            child: CircleAvatar(
              radius: 27,
              backgroundColor: kWhite,
              child: CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(
                  'assets/icons/user_male.png',
                ),
              ),
            ),
          ),
          title: Text(
            userName,
            style: TextStyle(
              fontSize: screenWidth / 22,
              fontFamily: kBold,
            ),
          ),
          trailing: trailing,
        ),
        box_15,
        if (details != null) details!,
        if (inProgress != null) inProgress!,
        box_15,
      ],
    );
  }
}
