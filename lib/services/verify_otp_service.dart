import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/helpers/api_request.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class VerifyOtpService {
  Future<void> verifyOtpRequest({
    required String pinController,
    required BuildContext context,
    required String nextPage,
  }) async {
    await ApiRequest().post(
      url: 'worker/verify-otp',
      data: {
        'code': pinController,
      },
      token: await kSecureStorage.read(key: 'token'),
      onPressedSuccess: () {
        Navigator.pushReplacementNamed(
          context,
          nextPage,
        );
      },
    );
  }

  Future<void> resendPhoneNumberRequest() async {
    String? token = await kSecureStorage.read(key: 'token');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token!);
    String phoneNumber =
        decodedToken.containsKey('phone') ? decodedToken['phone'] : '';

    await ApiRequest().post(
      url: 'user/check-phone',
      data: {'phone': phoneNumber},
      writeToken: true,
    );
  }
}
