import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newst_app/core/constant/app_colors.dart';
import 'package:newst_app/core/widget/custom_eleveted_button.dart';
import 'package:newst_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:newst_app/features/onboarding/presentation/manager/onboarding_controller.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      itemCount: OnboardingModel.onboardingList.length,
                      controller: controller.pageController,
                      onPageChanged: (index) => context
                          .read<OnboardingController>()
                          .mCurrentIndex(index),
                      itemBuilder: (context, index) {
                        final OnboardingModel model =
                            OnboardingModel.onboardingList[index];
                        return Column(
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
                          ],
                        );
                      },
                    ),
                  ),
                  Consumer<OnboardingController>(
                    builder:
                        (
                          BuildContext context,
                          OnboardingController value,
                          Widget? child,
                        ) {
                          return SizedBox(
                          
                            child: SmoothPageIndicator(
                              controller: value.pageController, // PageController
                              count: 3,
                              axisDirection: Axis.horizontal,
                              effect: SwapEffect(activeDotColor: AppColors.red),
                            ),
                          );
                        },
                  ),
                  Gap(80),
                  Consumer<OnboardingController>(
                    builder: (BuildContext context, value, Widget? child) {
                      return CustomElevetedButton(
                        title: value.isLastPage ? 'Get Started' : 'Next',
                        onPressed: () {
                          controller.pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeOut,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
