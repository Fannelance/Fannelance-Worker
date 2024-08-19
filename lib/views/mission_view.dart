import 'package:fannelance_worker/core/assets.dart';
import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/widgets/mission_alertdialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestView extends StatefulWidget {
  final dynamic userData;
  const RequestView({super.key, this.userData});

  @override
  State<RequestView> createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView> {
  Future<String> getCurrentLocation(double lat, double long) async {
    List<Placemark> location = await placemarkFromCoordinates(lat, long);
    Placemark place = location[0];

    return "${place.locality}, ${place.subAdministrativeArea}";
  }

  String? locationString;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final latitude = widget.userData['location']['coordinates'][0];
    final longitude = widget.userData['location']['coordinates'][1];

    if (locationString == null) {
      getCurrentLocation(latitude, longitude).then((location) {
        setState(() {
          locationString = location;
        });
      });
    }
    String userName =
        toBeginningOfSentenceCase('${widget.userData!['firstname']} ') +
            toBeginningOfSentenceCase('${widget.userData!['lastname']}');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              'Mission started !',
              style: TextStyle(
                fontSize: screenWidth / 16,
                fontFamily: kBold,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: kBorder10,
                  boxShadow: [
                    BoxShadow(
                      color: kGrey8,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: kBlack,
                      child: CircleAvatar(
                        radius: 34,
                        backgroundColor: kWhite,
                        child: CircleAvatar(
                          radius: 31,
                          backgroundImage:
                              widget.userData!['gender'] == 'female'
                                  ? AssetsData.userFemale
                                  : AssetsData.userMale,
                        ),
                      ),
                    ),
                    box_5,
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: screenWidth / 20,
                      ),
                    ),
                    box_5,
                    Text(
                      locationString ?? 'Location is loading',
                      style: TextStyle(
                        fontSize: screenWidth / 24,
                        color: kGrey7,
                      ),
                    ),
                    box_5,
                    Text(
                      '5.7 kms away',
                      style: TextStyle(
                        fontSize: screenWidth / 24,
                        color: kGrey7,
                      ),
                    ),
                    box_5,
                    MaterialButton(
                      minWidth: 34,
                      height: 34,
                      color: kGreen,
                      onPressed: () async {
                        await launchUrl(
                          Uri(
                            scheme: 'tel',
                            path: widget.userData['phone'],
                          ),
                        );
                      },
                      shape: const CircleBorder(
                        side: BorderSide(
                          color: kGreen,
                        ),
                      ),
                      child: const Icon(
                        Icons.phone,
                        color: kWhite,
                        size: 23,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const RequestAlertdialogWidget();
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlack,
                  fixedSize: Size(
                    screenWidth - 100,
                    screenWidth / 8,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: kBorder10,
                  ),
                ),
                child: Center(
                  child: Text(
                    'End the mission',
                    style: TextStyle(
                      color: kWhite,
                      fontSize: screenWidth / 22,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
