import 'package:flutter/material.dart';
import 'package:newst_app/bottom_bar_viewes.dart';
import 'package:newst_app/features/auth/presentation/views/login_view.dart';
import 'package:newst_app/features/auth/presentation/views/register_view.dart';
import 'package:newst_app/features/bookmark/bookmark_view.dart';
import 'package:newst_app/features/home/presentation/views/home_view.dart';
import 'package:newst_app/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:newst_app/features/profile/presentation/views/language_view.dart';
import 'package:newst_app/features/profile/presentation/views/profile_view.dart';
import 'package:newst_app/features/search/search_view.dart';
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
      return MaterialPageRoute(builder: (_) => LoginView());
    case RegisterView.routName:
      return MaterialPageRoute(builder: (_) => RegisterView());
    case BookmarkView.routName:
      return MaterialPageRoute(builder: (_) => const BookmarkView());
    case SearchView.routName:
      return MaterialPageRoute(builder: (_) => const SearchView());
    case ProfileView.routName:
      return MaterialPageRoute(builder: (_) => const ProfileView());
    case LanguageView.routName:
      return MaterialPageRoute(builder: (_) => const LanguageView());
    case BottomBarViews.routName:
      return MaterialPageRoute(builder: (_) => const BottomBarViews());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
