import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/views/activity_view.dart';
import 'package:fannelance_worker/widgets/activity_widget.dart';
import 'package:flutter/material.dart';

class HomeActivityWidget extends StatelessWidget {
  const HomeActivityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Activity',
                style: TextStyle(
                  fontSize: screenWidth / 20,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ActivityView();
                  }));
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 4,
                    right: 12,
                  ),
                  child: Text(
                    'See All',
                    style: TextStyle(
                      shadows: const [
                        Shadow(
                          offset: Offset(0, -4),
                          color: kGrey5,
                        )
                      ],
                      color: Colors.transparent,
                      decoration: TextDecoration.underline,
                      decorationColor: kGrey5,
                      decorationThickness: 1.5,
                      fontSize: screenWidth / 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return const Column(
                children: [
                  ActivityWidget(),
                  Divider(thickness: 0.5),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
