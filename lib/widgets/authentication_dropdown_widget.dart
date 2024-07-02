import 'package:fannelance_worker/core/constants.dart';
import 'package:flutter/material.dart';

class AuthenticationDropdownWidget extends StatefulWidget {
  final String hintText;
  final void Function(String?)? onSelected;
  final List<DropdownMenuEntry<String>> dropdownMenuEntries;
  const AuthenticationDropdownWidget({
    super.key,
    required this.dropdownMenuEntries,
    required this.hintText,
    this.onSelected,
  });

  @override
  State<AuthenticationDropdownWidget> createState() =>
      AuthenticationDropdownWidgetState();
}

class AuthenticationDropdownWidgetState
    extends State<AuthenticationDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    const widgetStatePropertyAll = WidgetStatePropertyAll(kWhite);
    return DropdownMenu(
        onSelected: widget.onSelected,
        menuStyle: const MenuStyle(
          backgroundColor: widgetStatePropertyAll,
          surfaceTintColor: widgetStatePropertyAll,
        ),
        trailingIcon: const Icon(
          Icons.arrow_drop_down,
          size: 30,
          color: kGrey7,
        ),
        hintText: widget.hintText,
        width: screenWidth - 50,
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            color: kGrey6,
            fontWeight: FontWeight.w500,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          enabledBorder: authenticationBorder,
        ),
        dropdownMenuEntries: widget.dropdownMenuEntries);
  }
}
