import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/core/routes.dart';
import 'package:fannelance_worker/widgets/account_buttondialog_widget.dart';
import 'package:flutter/material.dart';

class RequestAlertdialogWidget extends StatelessWidget {
  const RequestAlertdialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: kWhite,
      surfaceTintColor: kWhite,
      actionsOverflowButtonSpacing: 10,
      insetPadding: const EdgeInsets.symmetric(horizontal: 55),
      iconPadding: const EdgeInsets.symmetric(vertical: 12),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),

      // Title
      title: Text(
        'Have you finished the mission?',
        style: TextStyle(
          fontSize: screenWidth / 20,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.left,
      ),

      // Subtitle
      content: Text(
        'Press "Cancel" if you haven\'t finished the current mission yet,\n'
        'Once you press "End", you\'ll be online to recieve more missions.',
        style: TextStyle(
          fontSize: screenWidth / 28,
          color: kGrey5,
        ),
      ),

      // Buttons
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonDialogAccountWidget(
              // End
              onPressed: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(kHomeRoute),
                );
              },
              text: 'End',
            ),
            const SizedBox(width: 6),
            // Cancel
            ButtonDialogAccountWidget(
              backgroundColor: kWhite,
              textColor: kBlack,
              borderColor: kGreyE8,
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
