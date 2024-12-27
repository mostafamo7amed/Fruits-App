import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits/core/utils/app_manager/app_assets.dart';
import 'package:fruits/features/onBoarding/view/on_boarding_view.dart';

import '../../../../generated/l10n.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const routeName = 'splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Row(
               mainAxisAlignment: S.delegate.isSupported(Locale('ar'))? MainAxisAlignment.end : MainAxisAlignment.start,
               children: [
                 SvgPicture.asset(AssetsData.plant),
               ],
             ),
             SvgPicture.asset(AssetsData.splashImage),
             SvgPicture.asset(AssetsData.splashBottom),

           ],
        ),
    );
  }

  void executeNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      if(!mounted) return;
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    });
  }
}
