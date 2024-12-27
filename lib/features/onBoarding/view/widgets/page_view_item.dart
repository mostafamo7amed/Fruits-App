import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/utils/app_manager/app_colors.dart';

import '../../../../constants.dart';
import '../../../../core/services/app_references.dart';
import '../../../../core/utils/app_manager/app_styles.dart';
import '../../../auth/presentation/view/login_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.backgroundImage, required this.isVisible});
  final String image;
  final Widget title;
  final String subtitle;
  final String backgroundImage;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SvgPicture.asset(backgroundImage,fit: BoxFit.fill,),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(image),
            ),
            Visibility(
              visible: isVisible,
              child: GestureDetector(
                onTap: () {
                  AppReference.setData(key: onBoardingKey, data: true);
                  Navigator.of(context).pushReplacementNamed(LoginView.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text('تخط',style: Styles.regular13.copyWith(color: AppColor.grayColor)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        title,
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0),
          child: Text(subtitle,textAlign: TextAlign.center,style: Styles.semiBold13.copyWith(color: AppColor.grayColor),),
        ),
      ],
    );
  }
}
