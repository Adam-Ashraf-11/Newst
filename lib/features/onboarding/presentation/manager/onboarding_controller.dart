import 'package:flutter/material.dart';
import 'package:newst_app/core/data_source/local_data/shared_config.dart';
import 'package:newst_app/core/data_source/local_data/shared_preferences.dart';
import 'package:newst_app/features/auth/presentation/views/login_view.dart';

class OnboardingController extends ChangeNotifier {
  int currentIndex = 0;
  bool isLastPage = false;
  final PageController pageController = PageController();
   void onboardingFinshed(BuildContext context) async {
   await PreferencesServer().setBool(SharedConfig.cOnboarding, true);
   Navigator.pushReplacementNamed(context, LoginView.routName);
  }

  void mCurrentIndex(int index) {
    if (index == 2) {
      isLastPage = true;
    } else {
      isLastPage = false;
    }

    currentIndex = index;
    notifyListeners();
  }
}
