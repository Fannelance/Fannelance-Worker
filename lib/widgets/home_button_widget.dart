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


  @override
  void initState() {
    super.initState();
    isAvailable = false;
  }


  void _connect(bool available,BuildContext context) {
    HomeViewState.socketService.connected(available);
    _listenToRequests(context);
  }

  void _listenToRequests(BuildContext context) {
    HomeViewState.socketService.listenToRequests( context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 60,
      height: 60,
      color: kBlack,
      onPressed: () {
        widget.onPressed();
        setState(() {
          isAvailable = !isAvailable;
          _connect(isAvailable, context);
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
