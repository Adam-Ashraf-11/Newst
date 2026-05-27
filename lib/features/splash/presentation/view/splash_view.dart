import 'package:flutter/material.dart';
import 'package:newst_app/core/data_source/local_data/shared_config.dart';
import 'package:newst_app/core/data_source/local_data/shared_preferences.dart';
import 'package:newst_app/features/auth/presentation/views/login_view.dart';
import 'package:newst_app/features/home/presentation/views/home_view.dart';
import 'package:newst_app/features/onboarding/presentation/manager/onboarding_controller.dart';
import 'package:newst_app/features/onboarding/presentation/views/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const routName = 'splashView';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    navigateMethod();
  }

  void navigateMethod() {
    final bool onboarding = PreferencesServer().getBool(SharedConfig.cOnboarding) ?? false;
    final bool isLoggedin = PreferencesServer().getBool(SharedConfig.cLogedin) ?? false;

    Future.delayed(const Duration(seconds: 3), () {
      if (!onboarding) {
        Navigator.pushReplacementNamed(context, OnboardingView.routName);
      } else if (!isLoggedin) {
        Navigator.pushReplacementNamed(context, LoginView.routName);
      } else {
        Navigator.pushReplacementNamed(context, HomeView.routName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Image.asset('assets/images/Splash.png'),
      ),
    );
  }
}
