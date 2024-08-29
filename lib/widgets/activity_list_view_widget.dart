import 'package:fannelance_worker/services/activity_service.dart';
import 'package:fannelance_worker/widgets/activity_empty_widget.dart';
import 'package:fannelance_worker/widgets/activity_widget.dart';
import 'package:fannelance_worker/widgets/circular_indicator_widget.dart';
import 'package:flutter/material.dart';

class ActivityListViewWidget extends StatelessWidget {
  final bool isrecent;
  final ScrollPhysics? physics;
  final double? fontSize;
  const ActivityListViewWidget({
    super.key,
    this.isrecent = true,
    this.physics,
    this.fontSize,
  });

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ActivityService().activityRequest(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.hasError) {
          return const CircularIndicatorWidget();
        } else if (!snapshot.hasData ||
            snapshot.data == null ||
            snapshot.data['data'] == null ||
            (snapshot.data['data'] as List).isEmpty) {
          return ActivityEmptyWidget(
            fontSize: fontSize,
          );
        } else {
          final snapData = snapshot.data['data'] as List;
          final reversedRequests = snapData.reversed.toList();
          return ListView.builder(
            shrinkWrap: isrecent,
            physics: physics,
            itemCount: isrecent
                ? snapData.length > 2
                    ? 2
                    : snapData.length
                : snapData.length,
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
