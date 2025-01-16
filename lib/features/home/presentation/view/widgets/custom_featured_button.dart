import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_manager/app_styles.dart';

import '../../../../../core/utils/app_manager/app_colors.dart';


class CustomFeaturedButton extends StatelessWidget {
  const CustomFeaturedButton(
      {super.key, this.text, required this.onPressed, this.isLoading = false});
  final String? text;
  final void Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: AppColor.whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5))),
        child: !isLoading
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                text ?? '',
                style:Styles.bold16.copyWith(color: AppColor.primaryColor),
              ),
            ),
          ],
        )
            : Center(
          child: SizedBox(
            width: 25,
            height: 25,
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
