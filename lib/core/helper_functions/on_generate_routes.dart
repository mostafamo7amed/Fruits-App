import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/features/onBoarding/view/on_boarding_view.dart';
import 'package:fruits/features/splash/presentation/view/splash_view.dart';

import '../../features/auth/presentation/view/login_view.dart';

Route<dynamic> onGenerateRoute (RouteSettings settings){
  switch(settings.name){
    case  SplashView.routeName:
      return CupertinoPageRoute(builder: (_) => const SplashView());
    case  LoginView.routeName:
      return CupertinoPageRoute(builder: (_) => const LoginView());
    case  OnBoardingView.routeName:
      return CupertinoPageRoute(builder: (_) => const OnBoardingView());
    default:
      return CupertinoPageRoute(builder: (_) => const Scaffold());
  }
}