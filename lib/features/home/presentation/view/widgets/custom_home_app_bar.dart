import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits/core/helper_functions/current_time.dart';
import 'package:fruits/core/utils/app_manager/app_assets.dart';

import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,});



  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(AssetsData.profileImage),
      title: Text(
        currentTime().contains('AM')?
        'صباح الخير !..':'مساء الخير !..',
        style: Styles.regular16.copyWith(color: AppColor.lightGrayColor),
      ),
      subtitle: Text(
        'محمد احمد',
        style: Styles.bold16,
      ),
      trailing: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColor.primaryColor.withValues(alpha: .1),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(AssetsData.notification,width: 30,height: 30,),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity,56);
}
