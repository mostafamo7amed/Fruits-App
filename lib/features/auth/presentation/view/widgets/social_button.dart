import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({super.key, required this.assetName, required this.title, this.onPressed});

  final String assetName;
  final String title;

  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1,color: AppColor.lightGrayColor),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: ListTile(
          visualDensity: VisualDensity(
            vertical: VisualDensity.minimumDensity
          ),
          leading: SvgPicture.asset(assetName),
          title: Text(title,style: Styles.bold16,textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
