import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/services/stripe_service.dart';
import 'package:flutter/material.dart';

class WalletDialogTopupWidget extends StatefulWidget {
  final Function() onValueUpdated;

  const WalletDialogTopupWidget({
    super.key,
    required this.onValueUpdated,
  });

  @override
  State<WalletDialogTopupWidget> createState() =>
      WalletDialogTopupWidgetState();
}

class WalletDialogTopupWidgetState extends State<WalletDialogTopupWidget> {
  static TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      backgroundColor: kWhite,
      surfaceTintColor: kWhite,
      title: const Column(
        children: [
          Image(
            image: AssetImage('assets/icons/wallet.png'),
            height: 95,
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top up your wallet',
            style: TextStyle(
              fontSize: screenWidth / 20,
              fontFamily: kBold,
            ),
          ),
          box_5,
          Text(
            'Recharge Your Falnnelance Wallet to Access Requests Instantly',
            style: TextStyle(
              fontSize: screenWidth / 28,
              color: kGrey6,
              fontFamily: kBold,
            ),
          ),
          TextField(
            controller: valueController,
            keyboardType: TextInputType.number,
            cursorColor: kGrey9,
            onTapOutside: (pointer) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            style: TextStyle(
              fontSize: screenWidth / 27,
              fontFamily: kSemiBold,
            ),
            decoration: InputDecoration(
              alignLabelWithHint: true,
              helperText: 'EGP',
              helperStyle: const TextStyle(fontFamily: kSemiBold),
              hintText: 'Enter the recharge value',
              hintStyle: TextStyle(
                  color: kGrey9,
                  fontSize: screenWidth / 27,
                  fontFamily: kSemiBold),
              focusColor: kGrey9,
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kGrey9),
              ),
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            var topUpValue = int.tryParse(valueController.text) ?? 0;
            await StripeService.handlePayment(
              context,
              topUpValue,
              widget.onValueUpdated,
            );
            if (context.mounted) {
              Navigator.pop(context);
            }
            valueController.clear();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kBlack,
            fixedSize: Size(
              double.infinity,
              screenWidth / 14,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: kBorder10,
            ),
          ),
          child: Center(
            child: Text(
              'Continue',
              style: TextStyle(
                color: kWhite,
                fontSize: screenWidth / 25,
              ),
            ),
          ),
        )
      ],
    );
  }
}
