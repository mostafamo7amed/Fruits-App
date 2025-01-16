import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;

import '../../../../../core/utils/app_manager/app_assets.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
import 'custom_featured_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: SvgPicture.asset(
                  AssetsData.onBoardingImage1,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: svg.Svg(AssetsData.featuredBG),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        'عروض العيد',
                        style: Styles.regular13
                            .copyWith(color: AppColor.whiteColor),
                      ),
                      Spacer(),
                      Text(
                        'خصم 25%',
                        style: Styles.bold19
                            .copyWith(color: AppColor.whiteColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomFeaturedButton(
                        onPressed: () {},
                        text: 'تسوق الان',
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
