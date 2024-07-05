import 'package:fannelance_worker/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivityWidget extends StatelessWidget {
  final dynamic userData;
  const ActivityWidget({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    String userName = toBeginningOfSentenceCase('${userData!['firstname']} ') +
        toBeginningOfSentenceCase('${userData!['lastname']}');
    DateTime createdAt = DateTime.parse(userData['request_date']);
    DateTime localDate = createdAt.toLocal();
    String formattedDate = DateFormat('dd MMM HH:mm').format(localDate);

    Uri url;
    return ListTile(
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
              Padding(
                padding: const EdgeInsets.all(0),
                child: Text(
                  formattedDate,
                  style: TextStyle(
                    fontSize: screenWidth / 26,
                    fontFamily: kBold,
                    color: kGrey7,
                  ),
                ),
              ),
            ],
          ),
          MaterialButton(
            minWidth: 35,
            height: 35,
            color: kGreen,
            onPressed: () async {
              url = Uri(
                scheme: 'tel',
                path: userData['phone'],
              );
              await launchUrl(url);
            },
            shape: const CircleBorder(
              side: BorderSide(
                color: kGreen,
              ),
            ),
            child: const Icon(
              Icons.phone,
              color: kWhite,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
