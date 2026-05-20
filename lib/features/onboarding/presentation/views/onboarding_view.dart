import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newst_app/core/widget/custom_eleveted_button.dart';
import 'package:newst_app/features/onboarding/data/models/onboarding_model.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController pageController = PageController();
  int currendIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff5f5f5),
        actions: [
          if (currendIndex != 2)
            Align(
              alignment: Alignment.topRight,
              child: TextButton(onPressed: () {}, child: Text('Skip')),
            ),
        ],
      ),
      backgroundColor: Color(0xfff5f5f5),
      body: SafeArea(
        child: PageView.builder(
          itemCount: OnboardingModel.onboardingList.length,
          controller: pageController,
          onPageChanged: (value) => setState(() => currendIndex = value),
          itemBuilder: (context, index) {
            final OnboardingModel model = OnboardingModel.onboardingList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(model.image),
                    Gap(20),
                    Text(
                      style: Theme.of(context).textTheme.bodyMedium,
                      model.title,
                    ),
                    Gap(12),
                    Text(
                      style: Theme.of(context).textTheme.bodySmall,
                      model.description,
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    CustomElevetedButton(
                      title: 'Next',
                      onPressed: () {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
