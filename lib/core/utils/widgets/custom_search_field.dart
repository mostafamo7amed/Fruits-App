import 'package:flutter/material.dart';

import '../app_manager/app_colors.dart';
import '../app_manager/app_styles.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField(
      {super.key, this.suffixIcon, this.hintText, this.prefixIcon});
  final Widget? suffixIcon, prefixIcon;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xfffcfcfc),
            blurRadius: 1,
            offset: Offset(0, 8),
          )
        ]
      ),
      width: double.infinity,
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: Styles.bold13.copyWith(color: AppColor.lightGrayColor),
          fillColor: AppColor.whiteColor,
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
        color: AppColor.whiteColor,
      ),
    );
  }
}
