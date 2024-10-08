
import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/core/routes.dart';
import 'package:fannelance_worker/helpers/api_request.dart';
import 'package:fannelance_worker/services/send_otp_service.dart';
import 'package:fannelance_worker/views/phone_number_view.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class CheckPhoneNumberService {
  static String phoneNumber = '';

  Future<void> checkPhoneNumberRequest({required BuildContext context}) async {
    await ApiRequest().post(
      url: 'worker/check-phone',
      data: {
        'phone': '+${PhoneNumberViewState.countryDialCode}'
            '${PhoneNumberViewState.phoneNumberController.text.substring(1)}',
      },
      onPressedSuccess: () {
        Navigator.pushNamed(
          context,
          kLoginRoute,
        );
      },
      onPressedNotSuccess: () async {
        await SendOtpService().sendOtpRequest();
        if (context.mounted) {
          Navigator.pushNamed(
            context,
            kOtpSignUpRoute,
          );
        }
      },
      writeToken: true,
    ); 

    String? token = await kSecureStorage.read(key: 'token');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
    phoneNumber =
        decodedToken.containsKey('phone') ? decodedToken['phone'] : '';
  }
}
