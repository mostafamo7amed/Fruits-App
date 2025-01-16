import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits/features/onBoarding/view/on_boarding_view.dart';
import 'package:fruits/features/splash/presentation/view/splash_view.dart';

import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view/signup_view.dart';
import '../../features/home/presentation/view/home_view.dart';

Route<dynamic> onGenerateRoute (RouteSettings settings){
  switch(settings.name){
    case  SplashView.routeName:
      return CupertinoPageRoute(builder: (_) => const SplashView());
    case  LoginView.routeName:
      return CupertinoPageRoute(builder: (_) => const LoginView());
    case  SignupView.routeName:
      return CupertinoPageRoute(builder: (_) => const SignupView());
    case  OnBoardingView.routeName:
      return CupertinoPageRoute(builder: (_) => const OnBoardingView());
    case  HomeView.routeName:
      return CupertinoPageRoute(builder: (_) => const HomeView());
    default:
      return CupertinoPageRoute(builder: (_) => const Scaffold());
  }
}