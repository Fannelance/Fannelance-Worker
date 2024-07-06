import 'package:fannelance_worker/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ActivityWidget extends StatelessWidget {
  final dynamic userData;
  const ActivityWidget({super.key, this.userData});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    String userName = toBeginningOfSentenceCase('${userData!['firstname']} ') +
        toBeginningOfSentenceCase('${userData!['lastname']}');

    DateTime createdAt = DateTime.parse(userData['request_date']);
    DateTime localDate = createdAt.toLocal();
    String formattedDate = DateFormat('dd MMM HH:mm').format(localDate);

    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: kBlack,
        child: CircleAvatar(
          radius: 27,
          backgroundColor: kWhite,
          child: CircleAvatar(
            radius: 24,
            backgroundImage: userData!['gender'] == 'female'
                ? femaleUserImage
                : maleUserImage,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(
                  fontSize: screenWidth / 24,
                  fontFamily: kBold,
                ),
              ),
              Text(
                '$formattedDate\n',
                style: TextStyle(
                  fontSize: screenWidth / 26,
                  color: kGrey7,
                ),
              ),
            ],
          ),
          // MaterialButton(
          //   minWidth: 35,
          //   height: 35,
          //   color: kGreen,
          //   onPressed: () async {
          //     await launchUrl(
          //       Uri(
          //         scheme: 'tel',
          //         path: userData['phone'],
          //       ),
          //     );
          //   },
          //   shape: const CircleBorder(
          //     side: BorderSide(
          //       color: kGreen,
          //     ),
          //   ),
          //   child: const Icon(
          //     Icons.phone,
          //     color: kWhite,
          //     size: 20,
          //   ),
          // ),
        ],
      ),
    );
  }
}
