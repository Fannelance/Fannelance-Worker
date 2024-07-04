import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/widgets/notification_animation_button_widget.dart';
import 'package:fannelance_worker/widgets/notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class NotificationDetailsWidget extends StatefulWidget {
  final dynamic userData;
  final dynamic request;

  const NotificationDetailsWidget(
      {super.key, required this.userData, required this.request});

  @override
  NotificationDetailsWidgetState createState() =>
      NotificationDetailsWidgetState();
}

class NotificationDetailsWidgetState extends State<NotificationDetailsWidget> {
  static var request;
  Future<String> getCurrentLocation(double lat, double long) async {
    List<Placemark> location = await placemarkFromCoordinates(lat, long);
    Placemark place = location[0];

    return "${place.locality}, ${place.subAdministrativeArea}";
  }

  String? locationString;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    request = widget.request;

    final latitude = widget.userData['location']['coordinates'][0];
    final longitude = widget.userData['location']['coordinates'][1];

    if (locationString == null) {
      getCurrentLocation(latitude, longitude).then((location) {
        setState(() {
          locationString = location;
        });
      });
    }

    var textStyle = TextStyle(
      fontSize: screenWidth / 24,
      fontFamily: kBold,
      color: kGrey3,
    );

    return NotificationWidget(
      userData: widget.userData,
      details: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locationString ?? 'Loading...',
              style: textStyle,
            ),
            Text(
              '5 kms away',
              style: textStyle,
            ),
            box_15,
            const NotificationAnimationButtonWidget(),
          ],
        ),
      ),
    );
  }
}
