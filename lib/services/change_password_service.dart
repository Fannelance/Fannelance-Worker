
import 'package:fannelance_worker/core/routes.dart';
import 'package:fannelance_worker/helpers/api_request.dart';
import 'package:fannelance_worker/views/change_password_view.dart';
import 'package:flutter/material.dart';

class ChangePasswordService {
  Future<void> changePasswordRequest(BuildContext context) async {
    await ApiRequest().put(
      url: 'worker/update-password',
      data: {
        'oldpassword': ChangePasswordviewState.passwordController.text,
        'newpassword': ChangePasswordviewState.newPasswordController.text,
        'repeatedpassword':
            ChangePasswordviewState.repeatedNewPasswordController.text,
      },
      onPressed: () {
        Navigator.pushReplacementNamed(
          context,
          kHomeRoute,
        );
      },
    );
  }
}
