import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/core/show_snackbar_messenger.dart';
import 'package:fannelance_worker/widgets/notification_details_widget.dart';
import 'package:fannelance_worker/widgets/notification_showmodal.dart';
import 'package:flutter/material.dart';

class ButtonHomeWidget extends StatefulWidget {
  const ButtonHomeWidget({
    super.key,
  });

  @override
  State<ButtonHomeWidget> createState() => ButtonHomeWidgetState();
}

class ButtonHomeWidgetState extends State<ButtonHomeWidget> {
  static bool isAvailable = false;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 80,
      height: 80,
      color: kBlack,
      onPressed: () {
        setState(() {
          isAvailable = !isAvailable;
        });
        NotificationShowModal.showModalSheet(
          context,
          const NotificationDetailsWidget(),
        );
        isAvailable
            ? ShowSnackbarMessenger.showSnackBarMessenger(
                context,
                const Text('You are online'),
              )
            : ShowSnackbarMessenger.showSnackBarMessenger(
                context,
                const Text('You are offline'),
              );
      },
      shape: const CircleBorder(),
      child: Text(
        isAvailable ? 'Stop' : 'Start',
        style: const TextStyle(
          color: kWhite,
          fontSize: 20,
        ),
      ),
    );
  }
}
