import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/services/stripe_service.dart';
import 'package:flutter/material.dart';

class WalletDialogTopupWidget extends StatefulWidget {
  final Function() onValueUpdated;
  final int topUpValue;

  const WalletDialogTopupWidget({
    super.key,
    required this.onValueUpdated,
    required this.topUpValue,
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
      title: Text(
        'Top up your wallet',
        style: TextStyle(
          fontSize: screenWidth / 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: TextField(
        controller: valueController,
        keyboardType: TextInputType.number,
        cursorColor: kBlack,
        onTapOutside: (pointer) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          alignLabelWithHint: true,
          helperText: 'EGP',
          hintText: 'Enter the recharge value',
          hintStyle: TextStyle(fontSize: screenWidth / 25),
          focusColor: kBlack,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kBlack),
          ),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            await StripeService.handlePayment(
              context,
              widget.topUpValue,
              widget.onValueUpdated,
            );
            if (context.mounted) {
              Navigator.pop(context);
            }
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
