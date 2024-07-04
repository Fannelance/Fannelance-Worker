import 'package:fannelance_worker/core/constants.dart';
import 'package:flutter/material.dart';

class AppBarMainWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMainWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      centerTitle: true,
      backgroundColor: kWhite,
      title: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth / 16,
          fontFamily: kBold,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
