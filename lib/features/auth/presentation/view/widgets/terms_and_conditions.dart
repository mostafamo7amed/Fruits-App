import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/utils/app_manager/app_assets.dart';
import 'package:fruits/core/utils/app_manager/app_colors.dart';
import 'package:fruits/core/utils/app_manager/app_styles.dart';

import 'custom_check_box.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool termsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: termsAccepted,
          onChecked: (value) {
            setState(() {
              termsAccepted = value;
            });
          },
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'من خلال إنشاء حساب ، فإنك توافق على ',
              style: Styles.semiBold13.copyWith(color: AppColor.lightGrayColor),
              children: <TextSpan>[
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: Styles.semiBold13.copyWith(
                      color: AppColor.primaryColor.withValues(alpha: .7)),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      //TODO: navigate to terms and conditions
                    },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
