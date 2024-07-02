import 'package:fannelance_worker/core/constants.dart';
import 'package:fannelance_worker/services/signup_service.dart';
import 'package:fannelance_worker/views/change_password_view.dart';
import 'package:fannelance_worker/widgets/app_bar_sub_widget.dart';
import 'package:fannelance_worker/widgets/authentication_body_widget.dart';
import 'package:fannelance_worker/widgets/authentication_dropdown_widget.dart';
import 'package:fannelance_worker/widgets/authentication_textfield_widget.dart';
import 'package:flutter/material.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => SignupViewState();
}

class SignupViewState extends State<SignupView> {
  static TextEditingController firstNameController = TextEditingController();
  static TextEditingController lastNameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static String selectedGender = '';
  static String selectedJobTitle = '';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const AppBarSubWidget(),
      body: AuthenticationBodyWidget(
        title: 'Create Account',
        helperText: 'Get ready to relax while we take care of your home.',
        registrationData: Column(
          children: [
            AuthenticationTextFieldWidget(
              hint: 'First Name',
              controller: firstNameController,
            ),
            box_15,
            AuthenticationTextFieldWidget(
              hint: 'Last Name',
              controller: lastNameController,
            ),
            box_15,
            AuthenticationTextFieldWidget(
              hint: 'Email',
              controller: emailController,
            ),
            box_15,
            AuthenticationDropdownWidget(
              onSelected: (value) {
                if (value != null) {
                  selectedGender = value;
                }
              },
              dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                DropdownMenuEntry(
                  label: 'Male',
                  value: 'Male',
                ),
                DropdownMenuEntry(
                  label: 'Female',
                  value: 'Female',
                ),
              ],
              hintText: 'Gender',
            ),
            box_15,
            AuthenticationDropdownWidget(
              onSelected: (value) {
                if (value != null) {
                  selectedJobTitle = value;
                }
              },
              dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                DropdownMenuEntry(
                  label: 'Carpentry',
                  value: 'Carpentry',
                ),
                DropdownMenuEntry(
                  label: 'Cleaning',
                  value: 'Cleaning',
                ),
                DropdownMenuEntry(
                  label: 'Painting',
                  value: 'Painting',
                ),
                DropdownMenuEntry(
                  label: 'Plumbing',
                  value: 'Plumbing',
                ),
                DropdownMenuEntry(
                  label: 'Electricity',
                  value: 'Electricity',
                ),
                DropdownMenuEntry(
                  label: 'Mechanic',
                  value: 'Mechanic',
                ),
                DropdownMenuEntry(
                  label: 'Gardening',
                  value: 'Gardening',
                ),
                DropdownMenuEntry(
                  label: 'Home Appliances',
                  value: 'Home Appliances',
                ),
              ],
              hintText: 'Job Title',
            ),
            box_15,
          ],
        ),
        noteText: Column(
          children: [
            box_10,
            Row(
              children: [
                Flexible(
                  child: Text(
                    'By continuing you agree to our Terms of Service and Privacy Policy.',
                    maxLines: 3,
                    style: TextStyle(
                      color: kGrey5,
                      height: 1.2,
                      fontSize: screenWidth / 26,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        buttonText: 'Sign up',
        buttonOnPressed: () async {
          await SignupService().signupRequest(context);
          firstNameController.clear();
          lastNameController.clear();
          emailController.clear();
          ChangePasswordviewState.passwordController.clear();
        },
      ),
    );
  }
}
