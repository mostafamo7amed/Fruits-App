import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key, required this.isChecked, required this.onChecked,
  });
  final bool isChecked;

  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        width: 24,
        height: 24,
        duration: Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: isChecked ? AppColor.primaryColor : Colors.transparent,
          border: Border.all(color: isChecked ?  Colors.transparent : AppColor.checkBoxColor, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: isChecked ? Padding(
          padding: const EdgeInsets.all(4.0),
          child: SvgPicture.asset(AssetsData.check),
        ):SizedBox(),
      ),
    );
  }
}
