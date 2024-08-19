import 'package:fannelance_worker/core/assets.dart';
import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/widgets/notification_animation_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';

class NotificationWidget extends StatefulWidget {
  final dynamic userData;
  final dynamic request;

  const NotificationWidget({
    super.key,
    required this.userData,
    required this.request,
  });

  @override
  NotificationWidgetState createState() => NotificationWidgetState();
}

class NotificationWidgetState extends State<NotificationWidget> {
  static dynamic request;

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
    String userName =
        toBeginningOfSentenceCase('${widget.userData!['firstname']} ') +
            toBeginningOfSentenceCase('${widget.userData!['lastname']}');

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        box_10,
        ListTile(
          leading: CircleAvatar(
            radius: 28,
            backgroundColor: kBlack,
            child: CircleAvatar(
              radius: 27,
              backgroundColor: kWhite,
              child: CircleAvatar(
                radius: 24,
                backgroundImage: widget.userData!['gender'] == 'female'
                    ? AssetsData.userFemale
                    : AssetsData.userMale,
              ),
            ),
          ),
          title: Text(
            userName,
            style: TextStyle(
              fontSize: screenWidth / 22,
              fontFamily: kBold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              box_10,
              NotificationAnimationButtonWidget(
                userData: widget.userData,
              ),
              box_10,
            ],
          ),
        ),
      ],
    );
  }
}
