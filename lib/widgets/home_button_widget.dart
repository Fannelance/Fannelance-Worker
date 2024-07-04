import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/services/socket_service.dart';
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

  bool isDisposed = false;
  static late SocketService socketService;

  @override
  void initState() {
    super.initState();
    _initializeSocketService();
    isAvailable = false;
  }

  void _initializeSocketService() async {
    socketService = SocketService();
    await socketService.connect();
  }

  void _connect(bool available) {
    socketService.connected(available);
    _listenToRequests();
  }

  void _listenToRequests() {
    socketService.listenToRequests();
  }

  @override
  void dispose() {
    isDisposed = true;
    socketService.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    homeContext = context;
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
