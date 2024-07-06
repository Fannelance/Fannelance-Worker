import 'package:fannelance_worker/services/activity_service.dart';
import 'package:fannelance_worker/widgets/activity_widget.dart';
import 'package:fannelance_worker/widgets/circular_indicator_widget.dart';
import 'package:flutter/material.dart';

class ActivityListViewWidget extends StatelessWidget {
  final bool isrecent;
  final bool isReverse;
  final ScrollPhysics? physics;
  const ActivityListViewWidget({
    super.key,
    this.isrecent = true,
    this.physics,
    this.isReverse = false,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ActivityService().activityRequest(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Padding(
            padding: EdgeInsets.only(top: 150.0),
            child: CircularIndicatorWidget(),
          );
        } else {
          var userData = snapshot.data?['data'];
          return ListView.builder(
            reverse: isReverse,
            physics: physics,
            shrinkWrap: isrecent,
            itemCount: isrecent
                ? userData.length > 2
                    ? 2
                    : userData.length
                : userData.length,
            itemBuilder: (context, index) {
              int displayIndex = isrecent ? userData.length - 1 - index : index;
              return Column(
                children: [
                  ActivityWidget(
                    userData: userData[displayIndex],
                  ),
                  const Divider(thickness: 0.5),
                ],
              );
            },
          );
        }
      },
    );
  }
}
