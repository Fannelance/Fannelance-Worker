import 'package:fannelance_worker/views/account_view.dart';
import 'package:fannelance_worker/views/activity_view.dart';
import 'package:fannelance_worker/views/change_password_view.dart';
import 'package:fannelance_worker/views/forgot_password_view.dart';
import 'package:fannelance_worker/views/home_view.dart';
import 'package:fannelance_worker/views/login_view.dart';
import 'package:fannelance_worker/views/otp_view.dart';
import 'package:fannelance_worker/views/phone_number_view.dart';
import 'package:fannelance_worker/views/signup_view.dart';
import 'package:flutter/material.dart';

class Routes {
  Map<String, Widget Function(BuildContext)> routes = {
    kAccountRoute: (context) => const AccountView(),
    kHomeRoute: (context) => const HomeView(),
    kActivityRoute: (context) => const ActivityView(),
    kChangePasswordRoute: (context) => const ChangePasswordview(),
    kForgotPasswordRoute: (context) => const ForgotPasswordView(),
    kPhoneNumberRoute: (context) => const PhoneNumberView(),
    kLoginRoute: (context) => const LoginView(),
    kSignupRoute: (context) => const SignupView(),
    kOtpSignUpRoute: (context) {
      return const OTPView(
        nextPage: kSignupRoute,
      );
    },
    kOtpForgotPasswordRoute: (context) {
      return const OTPView(
        nextPage: kForgotPasswordRoute,
      );
    }
  };
}

const kHomeRoute = 'Home View';
const kChangePasswordRoute = 'Change Password View';
const kForgotPasswordRoute = 'Forgot Password View';
const kPhoneNumberRoute = 'Phone Number View';
const kOtpSignUpRoute = 'OTP Signup View';
const kOtpForgotPasswordRoute = 'OTP Forgot Password View';
const kLoginRoute = 'Login View';
const kSignupRoute = 'Signup View';
const kAccountRoute = 'Account View';
const kActivityRoute = 'activity View';