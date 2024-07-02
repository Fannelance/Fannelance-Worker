
import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/widgets/wallet_dialog_question_widget.dart';
import 'package:fannelance_worker/widgets/wallet_dialog_topup_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          box_50,
          Card(
            margin: const EdgeInsetsDirectional.symmetric(
              horizontal: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        FontAwesome5.coins,
                        color: kAmber,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Balance',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const WalletDialogQuestionWidget();
                            },
                          );
                        },
                        icon: const CircleAvatar(
                          radius: 12,
                          backgroundColor: kGrey5,
                          child: Icon(
                            Icons.question_mark,
                            size: 15,
                            color: kWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                  box_20,
                  const Text(
                    '100,00 EGP',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  box_20,
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const WalletDialogTopupWidget();
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kBlack,
                      fixedSize: Size(
                        double.infinity,
                        screenWidth / 7.3,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: kBorder16,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Top up',
                        style: TextStyle(
                          color: kWhite,
                          fontSize: screenWidth / 19,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
