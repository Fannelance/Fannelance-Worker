import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/services/socket_service.dart';
import 'package:fannelance_worker/widgets/home_activity_widget.dart';
import 'package:fannelance_worker/widgets/home_appbar_widget.dart';
import 'package:fannelance_worker/widgets/wallet_widget.dart';
import 'package:flutter/material.dart';
import 'package:fannelance_worker/widgets/home_button_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  bool isOnline = false;
  static late SocketService socketService;

  @override
  void initState() {
    super.initState();
    _initializeSocketService();
  }

  void _initializeSocketService() async {
    socketService = SocketService();
    await socketService.connect();
  }

  void _toggleStatus() {
    setState(() {
      isOnline = !isOnline;
    });
  }

  @override
  void dispose() {
    socketService.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ButtonHomeWidget(
        onPressed: _toggleStatus,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              box_50,
              HomeAppbarWidget(isOnline: isOnline),
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
