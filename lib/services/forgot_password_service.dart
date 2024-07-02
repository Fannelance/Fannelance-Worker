import 'package:fannelance_worker/core/routes.dart';
import 'package:fannelance_worker/helpers/api_request.dart';
import 'package:fannelance_worker/views/forgot_password_view.dart';
import 'package:flutter/material.dart';

class ForgotPasswordService {
  Future<void> forgotPasswordRequest(BuildContext context) async {
    await ApiRequest().put(
      url: 'worker/update-password',
      data: {
        'newpassword': ForgotPasswordViewState.newPasswordController.text,
        'repeatedpassword':
            ForgotPasswordViewState.repeatedNewPasswordController.text,
      },
      onPressed: () {
        Navigator.pushReplacementNamed(
          context,
          kLoginRoute,
        );
      },
    );
  }
}
