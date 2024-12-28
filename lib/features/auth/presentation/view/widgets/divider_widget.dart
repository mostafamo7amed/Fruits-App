import 'package:flutter/material.dart';

import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColor.lightGrayColor,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17.0),
          child: Text(
            'أو',
            style: Styles.semiBold16,),
        ),
        Expanded(
          child: Divider(
            color: AppColor.lightGrayColor,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}