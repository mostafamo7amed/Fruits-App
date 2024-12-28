import 'package:flutter/material.dart';

import '../app_manager/app_colors.dart';
import '../app_manager/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.controller, this.suffixIcon, this.hintText, this.validator, this.keyboardType});
  final TextEditingController controller;
  final Widget? suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;

  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: Styles.bold13.copyWith(color: AppColor.lightGrayColor),
          fillColor: AppColor.fillColor,
          filled: true,
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        width: 1,
        color: AppColor.lightGrayColor,
      ),
    );
  }
}
