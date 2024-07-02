

import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/core/routes.dart';
import 'package:fannelance_worker/helpers/api_request.dart';
import 'package:fannelance_worker/views/change_password_view.dart';
import 'package:flutter/material.dart';

class LoginService {
  Future<void> loginRequest(BuildContext context) async {
    try {
      await ApiRequest().post(
        url: 'worker/login',
        data: {
          'password': ChangePasswordviewState.passwordController.text,
        },
        token: await kSecureStorage.read(key: 'token'),
        onPressedSuccess: () {
          Navigator.of(context).pop();
          Navigator.pushReplacementNamed(
            context,
            kHomeRoute,
          );
        },
        writeToken: true,
      );
    } catch (e) {
      print('Error: $e');
    }
  }
}
