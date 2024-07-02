import 'package:flutter/material.dart';
import 'package:fannelance_worker/widgets/account_profile_widget.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                const AccountProfileWidget(),
                const SizedBox(width: 90),
                // Animated status indicator
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isOnline ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(width: 8),
                // Animated switcher for status text
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Text(
                    isOnline ? 'Online' : 'Offline',
                    key: ValueKey<bool>(
                        isOnline), // Ensure the text changes smoothly
                    style: TextStyle(
                      color: isOnline ? Colors.green : Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
