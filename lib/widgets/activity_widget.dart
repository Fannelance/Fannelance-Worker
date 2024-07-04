import 'package:fannelance_worker/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
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
                'John Doe',
                style: TextStyle(
                  fontSize: screenWidth / 22,
                  fontFamily: kBold,
                ),
              ),
              
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MaterialButton(
                minWidth: 35,
                height: 35,
                color: kGreen,
                onPressed: () async {
                  url = Uri(
                    scheme: 'tel',
                    path: '01025042013',
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '5th Jan 11:00',
                  style: TextStyle(
                    fontSize: screenWidth / 24,
                    fontFamily: kBold,
                    color: kGrey5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
