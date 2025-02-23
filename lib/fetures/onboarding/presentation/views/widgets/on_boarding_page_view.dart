import 'package:flutter/material.dart';
import 'package:medical_app/core/utils/assets.dart';
import 'package:medical_app/fetures/onboarding/presentation/views/widgets/page_view_item.dart';

class OnBoardingPageview extends StatelessWidget {
  const OnBoardingPageview({super.key, required this.pageController});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageviewItem(
          isVisible: true,
          image: Assets.imagesOnboarding1,
          subtitle: 'Get Your Checkups\nOnline. Anytime, \nAnywhere.',
        ),
        PageviewItem(
          isVisible: true,
          image: Assets.imagesOnboarding2,
          subtitle: 'With a group of\nexpert doctors from\nall over the world.',
        ),
        PageviewItem(
            topPadding: 90,
            isVisible: false,
            image: Assets.imagesOnvoarding3,
            subtitle:
                'keep up your health\nwith daily reports of\nyour body state.')
      ],
    );
  }
}
