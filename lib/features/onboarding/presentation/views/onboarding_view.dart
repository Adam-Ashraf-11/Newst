import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newst_app/core/widget/custom_eleveted_button.dart';
import 'package:newst_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:newst_app/features/onboarding/presentation/manager/onboarding_controller.dart';
import 'package:provider/provider.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingController(),
      builder: (context, _) {
        final controller = context.read<OnboardingController>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xfff5f5f5),
            actions: [
              Consumer<OnboardingController>(
                builder: (BuildContext context, value, Widget? child) {
                  return value.isLastPage
                      ? SizedBox()
                      : TextButton(onPressed: () {}, child: Text('Skip'));
                },
              ),
            ],
          ),
          backgroundColor: Color(0xfff5f5f5),
          body: SafeArea(
            child: PageView.builder(
              itemCount: OnboardingModel.onboardingList.length,
              controller: controller.pageController,
              onPageChanged: (index) =>
              context.read<OnboardingController>().mCurrentIndex(index),
              itemBuilder: (context, index) {
                final OnboardingModel model =
                 OnboardingModel.onboardingList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 16),
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
                      Consumer<OnboardingController>(
                        builder:
                            (BuildContext context, value, Widget? child) {
                              return CustomElevetedButton(
                                title: value.isLastPage
                                    ? 'Get Started'
                                    : 'Next',
                                onPressed: () {
                                  controller.pageController.nextPage(
                                    duration: const Duration(
                                      milliseconds: 300,
                                    ),
                                    curve: Curves.easeOut,
                                  );
                                },
                              );
                            },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
