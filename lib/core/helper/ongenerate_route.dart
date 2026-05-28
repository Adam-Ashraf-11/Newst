import 'package:flutter/material.dart';
import 'package:newst_app/features/auth/presentation/views/login_view.dart';
import 'package:newst_app/features/auth/presentation/views/register_view.dart';
import 'package:newst_app/features/home/presentation/views/home_view.dart';
import 'package:newst_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:newst_app/features/splash/presentation/view/splash_view.dart';


Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routName:
      return MaterialPageRoute(builder: (_) => const SplashView());
      case OnboardingView.routName:
      return MaterialPageRoute(builder: (_) => const OnboardingView());
      case HomeView.routName:
      return MaterialPageRoute(builder: (_) => const HomeView());
      case LoginView.routName:
      return MaterialPageRoute(builder: (_) =>  LoginView());
      case RegisterView.routName:
      return MaterialPageRoute(builder: (_) => const RegisterView());
    

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
