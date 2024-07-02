import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/widgets/account_profile_widget.dart';
import 'package:fannelance_worker/widgets/home_button_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: ButtonHomeWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            box_40,
            AccountProfileWidget(),
            
          ],
        ),
      ),
    );
  }
}

