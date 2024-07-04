import 'package:fannelance_worker/widgets/activity_widget.dart';
import 'package:fannelance_worker/widgets/app_bar_main_widget.dart';
import 'package:flutter/material.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarMainWidget(title: 'Activity',),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ActivityWidget();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(thickness: 0.5);
        },
      ),
    );
  }
}
