import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/widgets/notification_showmodal.dart';
import 'package:flutter/material.dart';

class NotificationButtonWidget extends StatelessWidget {
  final int seconds;
  const NotificationButtonWidget({super.key, required this.seconds});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return MaterialButton(
      color: kGreen,
      elevation: 0,
      minWidth: screenWidth,
      height: 44,
      shape: const RoundedRectangleBorder(
        borderRadius: kBorder16,
      ),
      onPressed: () {
        Navigator.pop(context);
        NotificationShowModal.showModalSheet(
          context,
           Container(),
        );
      },
      child: Row(
        children: [
          Stack(
            children: <Widget>[
              const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: kWhiteo,
                  backgroundColor:kWhiteo,
                  strokeWidth: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                child: Text(
                  '$seconds',
                  style: TextStyle(
                    color: kWhite,
                    fontSize: screenWidth / 22,
                    fontFamily: kBold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: screenWidth / 4,
          ),
          Text(
            'Accept',
            style: TextStyle(
              color: kWhite,
              fontSize: screenWidth / 22,
              fontFamily: kBold,
            ),
          ),
        ],
      ),
    );
  }
}
