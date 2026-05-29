import 'package:flutter/material.dart';
import 'package:newst_app/bottom_bar_viewes.dart';
import 'package:newst_app/core/data_source/local_data/shared_preferences.dart';
import 'package:newst_app/core/helper/ongenerate_route.dart';
import 'package:newst_app/core/theme/primary_app_theme.dart';
import 'package:newst_app/features/splash/presentation/view/splash_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesServer().init();
  runApp(const Newst());
}

class Newst extends StatelessWidget {
  const Newst({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashView.routName,
      onGenerateRoute: onGenerateRoutes,
      theme: primaryAppTheme,
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
