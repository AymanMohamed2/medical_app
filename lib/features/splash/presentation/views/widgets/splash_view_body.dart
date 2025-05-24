import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/strategies/complete_data_factory.dart';
import 'package:medical_app/core/strategies/user_role_navigation_stratery/user_role_navigation_factory.dart';
import 'package:medical_app/core/utils/assets.dart';
import 'package:medical_app/core/utils/service_locator.dart';
import 'package:medical_app/features/auth/data/models/user_model.dart';
import 'package:medical_app/features/auth/data/repository/auth_repository.dart';
import 'package:medical_app/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:medical_app/features/splash/presentation/views/widgets/sligding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> sligingAnimation;

  @override
  void initState() {
    super.initState();
    initSligdingAnimation();
    excuteNavigation();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(Assets.imagesLogo),
        SligdingText(sligingAnimation: sligingAnimation),
      ],
    );
  }

  void initSligdingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    sligingAnimation =
        Tween<Offset>(begin: const Offset(3, 3), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  Future<void> excuteNavigation() async {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        UserModel? user = await getIt.get<AuthRepository>().getUserData();
        if (user == null) {
          Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const OnBoardingView(),
            ),
          );
        } else {
          if (user.isCompeleteData) {
            // ignore: use_build_context_synchronously
            UserRoleNavigationFactory.create(user).executeNavigation(context);
          } else {
            CompleteDataNavigationFactory.create(user)
                // ignore: use_build_context_synchronously
                .excuteNavigation(context);
          }
        }
      },
    );
  }
}
