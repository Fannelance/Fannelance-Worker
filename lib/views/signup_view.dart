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
  static TextEditingController hourlyRateController = TextEditingController();
  static String selectedGender = '';
  static String selectedJobTitle = '';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    const List<Map<String, String>> jobsMenuItems = [
      {'label': 'Carpenter', 'value': 'Carpenter'},
      {'label': 'Cleaner', 'value': 'Cleaner'},
      {'label': 'Painter', 'value': 'Painter'},
      {'label': 'Plumber', 'value': 'Plumber'},
      {'label': 'Electrician', 'value': 'Electrician'},
      {'label': 'Mechanic', 'value': 'Mechanic'},
      {'label': 'Gardener', 'value': 'Gardener'},
      {'label': 'Home Appliances', 'value': 'Technician'},
    ];

    final List<DropdownMenuEntry<String>> jobDropdownMenuEntries = jobsMenuItems
        .map((item) => DropdownMenuEntry(
              label: item['label']!,
              value: item['value']!,
            ))
        .toList();

    const List<Map<String, String>> genderMenuItems = [
      {'label': 'Female', 'value': 'Female'},
      {'label': 'Male', 'value': 'Male'},
    ];

    final List<DropdownMenuEntry<String>> gendreDropdownMenuEntries =
        genderMenuItems
            .map(
              (item) => DropdownMenuEntry(
                label: item['label']!,
                value: item['value']!,
              ),
            )
            .toList();

    return Scaffold(
      appBar: const AppBarSubWidget(),
      body: AuthenticationBodyWidget(
        title: 'Create Account',
        helperText: 'Get ready to relax while we take care of your home.',
        registrationData: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AuthenticationTextFieldWidget(
                    hint: 'First Name',
                    controller: firstNameController,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AuthenticationTextFieldWidget(
                    hint: 'Last Name',
                    controller: lastNameController,
                  ),
                ),
              ],
            ),
            // box_15,

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
              dropdownMenuEntries: gendreDropdownMenuEntries,
              hintText: 'Gender',
            ),
            box_15,
            AuthenticationDropdownWidget(
              onSelected: (value) {
                if (value != null) {
                  selectedJobTitle = value;
                }
              },
              dropdownMenuEntries: jobDropdownMenuEntries,
              hintText: 'Job Title',
            ),
            box_15,
            AuthenticationTextFieldWidget(
              hint: 'Hourly Rate',
              controller: hourlyRateController,
              inputType: TextInputType.number,
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
          hourlyRateController.clear();
          ChangePasswordviewState.passwordController.clear();
          selectedGender = '';
          selectedJobTitle = '';
        },
      ),
    );
  }
}
