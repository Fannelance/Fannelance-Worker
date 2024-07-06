import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/views/home_view.dart';
import 'package:flutter/material.dart';

class ButtonHomeWidget extends StatefulWidget {
  final Function() onPressed;
  const ButtonHomeWidget({
    super.key,
    required this.onPressed,
  });

  @override
  State<ButtonHomeWidget> createState() => ButtonHomeWidgetState();
}

class ButtonHomeWidgetState extends State<ButtonHomeWidget> {
  static bool isAvailable = false;
  static BuildContext? homeContext;


  @override
  void initState() {
    super.initState();
    isAvailable = false;
  }


  void _connect(bool available) {
    HomeViewState.socketService.connected(available);
    _listenToRequests();
  }

  void _listenToRequests() {
    HomeViewState.socketService.listenToRequests();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      homeContext = context;
    });
    return MaterialButton(
      minWidth: 60,
      height: 60,
      color: kBlack,
      onPressed: () {
        widget.onPressed();
        setState(() {
          isAvailable = !isAvailable;
          _connect(isAvailable);
        });
      },
      shape: const CircleBorder(),
      child: Text(
        isAvailable ? 'Stop' : 'Start',
        style: const TextStyle(
          color: kWhite,
          fontSize: 18,
        ),
      ),
    );
  }
}
