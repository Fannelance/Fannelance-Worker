import 'package:fannelance_worker/services/activity_service.dart';
import 'package:fannelance_worker/widgets/activity_widget.dart';
import 'package:fannelance_worker/widgets/circular_indicator_widget.dart';
import 'package:flutter/material.dart';

class ActivityListViewWidget extends StatelessWidget {
  final bool isrecent;
  final ScrollPhysics? physics;
  const ActivityListViewWidget({
    super.key,
    this.isrecent = true,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ActivityService().activityRequest(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const CircularIndicatorWidget();
        } else {
          var userData = snapshot.data?['data'];
          final reversedRequests = userData.reversed.toList();
          return ListView.builder(
            shrinkWrap: isrecent,
            physics: physics,
            itemCount: isrecent
                ? userData.length > 2
                    ? 2
                    : userData.length
                : userData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ActivityWidget(
                    userData: reversedRequests[index],
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
