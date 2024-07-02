
import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/widgets/wallet_card_widget.dart';
import 'package:flutter/material.dart';

class WalletDialogTopupWidget extends StatelessWidget {
  const WalletDialogTopupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      title: Text(
        'Top up your wallet',
        style: TextStyle(
          fontSize: screenWidth / 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      content: TextField(
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
          onPressed: () {
            Navigator.pop(context);
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return const WalletCardWidget();
              },
            );
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
