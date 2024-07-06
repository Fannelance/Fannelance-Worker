import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/services/wallet_service.dart';
import 'package:fannelance_worker/widgets/circular_indicator_widget.dart';
import 'package:fannelance_worker/widgets/wallet_dialog_topup_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class WalletWidget extends StatefulWidget {
  const WalletWidget({super.key});

  @override
  State<WalletWidget> createState() => WalletWidgetState();
}

class WalletWidgetState extends State<WalletWidget> {
  bool isLoading = true;
  int currentBalance = 0;

  @override
  void initState() {
    super.initState();
    fetchCurrentBalance();
  }

  updateCurrentBalance() {
    setState(() {
      int newValue =
          int.tryParse(WalletDialogTopupWidgetState.valueController.text) ?? 0;
      WalletService().topUpWalletRequest(newValue).then((_) {
        fetchCurrentBalance();
      });
    });
  }

  Future<void> fetchCurrentBalance() async {
    var response = await WalletService().getWalletRequest();
    setState(() {
      currentBalance = int.parse(response["data"].toString());
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(left: 25, right: 25, top: 13),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kWhite,
        borderRadius: kBorder10,
        boxShadow: [
          BoxShadow(
            color: kGrey8,
            blurRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Iconsax.wallet_34,
                    size: 28,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, left: 8),
                    child: Text(
                      'Balance',
                      style: TextStyle(fontSize: screenWidth / 22),
                    ),
                  ),
                ],
              ),
              box_10,
              isLoading
                  ? const CircularIndicatorWidget()
                  : Text(
                      '$currentBalance EGP',
                      style: TextStyle(
                        fontSize: screenWidth / 18,
                        color: kPrimaryColor,
                      ),
                    ),
            ],
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return WalletDialogTopupWidget(
                    onValueUpdated: () {
                      updateCurrentBalance();
                    },
                  );
                },
              );
            },
            icon: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: kPrimaryColor,
                    width: 2,
                  ),
                  shape: BoxShape.circle),
              child: const Icon(
                Icons.add,
                size: 32,
                color: kPrimaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
