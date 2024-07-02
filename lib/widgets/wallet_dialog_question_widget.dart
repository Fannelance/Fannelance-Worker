import 'package:fannelance_worker/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalletDialogQuestionWidget extends StatelessWidget {
  const WalletDialogQuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: kWhite,
      surfaceTintColor: kWhite,
      iconPadding: const EdgeInsets.only(
        top: 4,
        right: 4,
      ),
      contentPadding: const EdgeInsets.only(
        bottom: 16,
        left: 16,
        right: 16,
      ),
      icon: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          icon: const Icon(
            FontAwesomeIcons.xmark,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Top up your wallet regularly so that you can receive orders from customers.',
            style: TextStyle(
              fontSize: screenWidth / 25,
            ),
          ),
          Text(
            'If your balance reaches -100 EGP, you will not be able to receive any order until you recharge it.',
            style: TextStyle(
              fontSize: screenWidth / 25,
            ),
          ),
        ],
      ),
    );
  }
}
