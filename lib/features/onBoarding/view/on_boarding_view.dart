import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits/constants.dart';
import 'package:fruits/core/services/app_references.dart';
import 'package:fruits/core/utils/app_manager/app_colors.dart';
import 'package:fruits/core/utils/widgets/custom_button.dart';
import 'package:fruits/features/onBoarding/view/widgets/on_boarding_page_view.dart';

import '../../auth/presentation/view/login_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  static const String routeName = "onBoardingView";


  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController pageController;
  int currentIndex = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentIndex = pageController.page!.round();
      setState(() {});
    });
    super.initState();
  }

  @override
  dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: OnBoardingPageView( pageController: pageController,),),
            DotsIndicator(dotsCount: 2,
              decorator: DotsDecorator(
                activeColor: AppColor.primaryColor,
                color: currentIndex == 1 ? AppColor.primaryColor : AppColor.primaryColor.withValues(alpha: 0.5),
              ),
            ),
            SizedBox(height: 30,),
            Visibility(
              visible: currentIndex == 1,maintainAnimation: true,maintainSize: true, maintainState: true,
                child: CustomButton(onPressed: (){
                  AppReference.setData(key: onBoardingKey, data: true);
                  Navigator.of(context).pushReplacementNamed(LoginView.routeName);
                },text: "ابدأ الان",),),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
