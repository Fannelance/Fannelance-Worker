import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationAcceptedWidget extends StatelessWidget {
  const NotificationAcceptedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    Uri url;
    return Container();
    // return NotificationWidget(
    //   trailing: MaterialButton(
    //     minWidth: 44,
    //     height: 44,
    //     color: kBlack,
    //     onPressed: () async {
    //       url = Uri(
    //         scheme: 'tel',
    //         path: '01025042013',
    //       );
    //       await launchUrl(url);
    //     },
    //     shape: const CircleBorder(
    //       side: BorderSide(
    //         color: kBlack,
    //       ),
    //     ),
    //     child: const Icon(
    //       Icons.phone,
    //       color: kWhite,
    //       size: 28,
    //     ),
    //   ),
    //   inProgress: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       const Icon(FontAwesomeIcons.spinner),
    //       const SizedBox(
    //         width: 10,
    //       ),
    //       Text(
    //         'In progress',
    //         style: TextStyle(
    //           fontSize: screenWidth / 22,
    //           fontFamily: kBold,
    //           color: kGrey3,
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
