import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_manager/app_assets.dart';
import 'package:fruits/core/utils/app_manager/app_styles.dart';
import 'package:fruits/features/onBoarding/view/widgets/page_view_item.dart';

import '../../../../core/utils/app_manager/app_colors.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
            isVisible:(!pageController.hasClients?0: pageController.page!.round()) == 0,
            image: AssetsData.onBoardingImage1,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('مرحبًا بك في', style: Styles.bold23),
                Text(
                  ' HUB',
                  style: Styles.bold23.copyWith(color: AppColor.yellowColor),
                ),
                Text(
                  'Fruit',
                  style: Styles.bold23.copyWith(color: AppColor.primaryColor),
                ),
              ],
            ),
            subtitle:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
            backgroundImage: AssetsData.onBoardingBackImage1),
        PageViewItem(
            isVisible:(!pageController.hasClients? 0: pageController.page!.round()) == 0,
            image: AssetsData.onBoardingImage2,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ابحث وتسوق',style: Styles.bold23),
              ],
            ),
            subtitle:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
            backgroundImage: AssetsData.onBoardingBackImage2),
      ],
    );
  }
}
