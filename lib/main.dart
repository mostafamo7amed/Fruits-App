import 'package:flutter/material.dart';
import 'package:fruits/core/helper_functions/on_generate_routes.dart';

import 'features/splash/presentation/view/splash_view.dart';

void main() {
  runApp(const Fruits());
}

class Fruits extends StatelessWidget {
  const Fruits({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute:  SplashView.routeName,
      onGenerateRoute: onGenerateRoute ,
    );
  }
}
