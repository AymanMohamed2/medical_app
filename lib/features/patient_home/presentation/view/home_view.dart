import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/assets.dart';
import 'package:medical_app/features/chat/presentation/view/chat_view.dart';
import 'package:medical_app/features/patient_home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            child:
                SizedBox(height: 38, child: Image.asset(Assets.imagesAiRobot)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const ChatView(),
                ),
              );
            }),
        body: HomeViewBody(),
      ),
    );
  }
}
