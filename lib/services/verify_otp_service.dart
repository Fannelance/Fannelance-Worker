
import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/helpers/api_request.dart';
import 'package:flutter/material.dart';

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
}
