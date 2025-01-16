import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_manager/app_colors.dart';

import '../../../../../core/utils/app_manager/app_styles.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Text(
            'الاكثر مبيعا',
            style: Styles.bold16,
          ),
          Spacer(),
          Text(
            'المزيد',
            style: Styles.regular13.copyWith(
              color: AppColor.lightGrayColor,
            ),
          ),
        ],
      ),
    );
  }
}
