import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/core/routes.dart';
import 'package:flutter/material.dart';

class AccountProfileWidget extends StatelessWidget {
  const AccountProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, kAccountRoute);
        },
        child: const CircleAvatar(
          radius: 28,
          backgroundColor: kBlack,
          child: CircleAvatar(
            radius: 27,
            backgroundColor: kWhite,
            child: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(
                'assets/icons/male.png',
              ),
            ),
          ),
        ));
  }
}
