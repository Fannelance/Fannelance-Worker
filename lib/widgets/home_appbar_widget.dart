import 'package:fannelance_worker/widgets/account_profile_widget.dart';
import 'package:fannelance_worker/widgets/home_on_off_widget.dart';
import 'package:flutter/material.dart';

class HomeAppbarWidget extends StatelessWidget {
  final bool isOnline;

  const HomeAppbarWidget({
    super.key,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const AccountProfileWidget(),
        const Spacer(flex: 1),
        HomeOnOffWidget(isOnline: isOnline),
        const Spacer(flex: 2),
      ],
    );
  }
}
