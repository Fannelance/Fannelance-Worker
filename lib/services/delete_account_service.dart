
import 'package:fannelance_worker/core/routes.dart';
import 'package:fannelance_worker/helpers/api_request.dart';
import 'package:flutter/material.dart';

class DeleteAccountService {
  Future<void> deleteAccountRequest(BuildContext context) async {
    await ApiRequest().delete(
      url: 'worker/delete-account',
      context: context,
      onPressed: () {
        Navigator.pushReplacementNamed(
          context,
          kPhoneNumberRoute,
        );
      },
    );
  }
}
