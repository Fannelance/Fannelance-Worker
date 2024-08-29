import 'package:fannelance_worker/core/assets.dart';
import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/core/routes.dart';
import 'package:fannelance_worker/services/user_data_service.dart';
import 'package:fannelance_worker/widgets/circular_indicator_widget.dart';
import 'package:flutter/material.dart';

class AccountProfileWidget extends StatelessWidget {
  const AccountProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserDataService().userDataRequest(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularIndicatorWidget();
        } else {
          var userData = snapshot.data?['data'];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, kAccountRoute);
            },
            child: CircleAvatar(
              radius: 28,
              backgroundColor: kBlack,
              child: CircleAvatar(
                radius: 27,
                backgroundColor: kWhite,
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: userData!['gender'] == 'female'
                      ? AssetsData.workerFemale
                      : AssetsData.workerMale,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
