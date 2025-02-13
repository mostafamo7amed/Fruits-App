import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits/core/helper_functions/on_generate_routes.dart';
import 'package:fruits/core/services/app_references.dart';
import 'package:fruits/core/services/git_it_services.dart';
import 'package:fruits/core/utils/app_manager/app_colors.dart';

import 'core/services/custom_bloc_observer.dart';
import 'features/splash/presentation/view/splash_view.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   await AppReference.init();
   setupGitIt();
  Bloc.observer = CustomBlocObserver();
  runApp(const Fruits());
}

class Fruits extends StatelessWidget {
  const Fruits({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar'),
      title: 'Fruits',
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: AppColor.whiteColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: true,
      ),
      initialRoute:  SplashView.routeName,
      onGenerateRoute: onGenerateRoute ,
    );
  }
}
