import 'package:fannelance_worker/widgets/activity_list_view_widget.dart';
import 'package:fannelance_worker/widgets/app_bar_main_widget.dart';
import 'package:flutter/material.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarMainWidget(
        title: 'Activity',
      ),
      body: ActivityListViewWidget(
        isrecent: false,
        isReverse: true,
      ),
    );
  }
}

