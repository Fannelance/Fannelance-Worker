import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/widgets/home_activity_widget.dart';
import 'package:fannelance_worker/widgets/home_on_off_widget.dart';
import 'package:fannelance_worker/widgets/wallet_widget.dart';
import 'package:flutter/material.dart';
import 'package:fannelance_worker/widgets/home_button_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isOnline = false;

  void toggleStatus() {
    setState(() {
      isOnline = !isOnline;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ButtonHomeWidget(
        onPressed: toggleStatus,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              box_50,
              OnOffHomeWidget(isOnline: isOnline),
              box_40,
              const WalletWidget(),
              box_50,
              const HomeActivityWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

